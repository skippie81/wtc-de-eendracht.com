#!/usr/bin/env python3

import csv
import sys
import datetime
import re
import locale

cal = []

date_format = '%m/%d/%y'
hour_fmt = '%H:%M'
datum_kalender_format = '%a %d-%m-%Y'

with open(sys.argv[1], 'r') as csvfile:
    reader = csv.reader(csvfile, delimiter=',')
    for row in reader:
        print(row)
        rit_nr = row[0]
        ploeg = row[1].upper().replace('+','P')
        datum = row[2]
        vertrekuur = row[3]
        naam = row[5].lower()
        afstand = row[6]
        gpx = row[7].lower().replace(' ','_').replace('+', 'plus')

        datum = datetime.datetime.strptime(datum, date_format)
        vertrekuur = datetime.datetime.strptime(vertrekuur, hour_fmt)

        cal.append(
            {
                'nr': rit_nr,
                'ploeg': ploeg,
                'datum': datum,
                'vertrek': vertrekuur,
                'naam': naam,
                'afstand': afstand,
                'gpx': gpx
            }
        )

for ploeg in ['A', 'B', 'BP']:
    locale.setlocale(locale.LC_ALL, 'nl_BE')
    with open(f'{ploeg.lower()}_kalender.html', 'w') as kalender:
        header = '<table class="table"><thead><tr><th>#</th><th>Datum</th><th>Uur</th><th>Afstand</th><th>GPX</th></tr></thead>'
        kalender.write(f'{header}\n')
        kalender.write('<tbody>\n')
        for rit in cal:
            if rit['ploeg'] == ploeg:
                gpx = rit['gpx']
                uur = rit['vertrek'].strftime(hour_fmt)
                datum = rit['datum'].strftime(datum_kalender_format)
                naam = rit['naam'].lower()
                nr = rit['nr']

                naam = re.sub(f'^ *rit *[0-9{ploeg.lower()} ]*- *','',naam)
                gpx = f'<a href="gpx/{gpx}">{naam.replace('-',' ').title()}</a>'

                entry = f"<tr><td>{nr}</td> <td>{datum}</td> <td>{uur}</td> <td>{rit['afstand']}km</td> <td>{gpx}</td></tr>"

                kalender.write(f'{entry}\n')
        kalender.write('</tbody></table>\n')


'''
<table class="table">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">First</th>
      <th scope="col">Last</th>
      <th scope="col">Handle</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td>Mark</td>
      <td>Otto</td>
      <td>@mdo</td>
    </tr>
    <tr>
      <th scope="row">2</th>
      <td>Jacob</td>
      <td>Thornton</td>
      <td>@fat</td>
    </tr>
    <tr>
      <th scope="row">3</th>
      <td>Larry</td>
      <td>the Bird</td>
      <td>@twitter</td>
    </tr>
  </tbody>
</table>
'''