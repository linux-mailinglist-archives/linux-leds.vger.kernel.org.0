Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DEEA4D5705
	for <lists+linux-leds@lfdr.de>; Sun, 13 Oct 2019 19:29:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728839AbfJMR36 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 13 Oct 2019 13:29:58 -0400
Received: from smtp.220.in.ua ([89.184.67.205]:42930 "EHLO smtp.220.in.ua"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726264AbfJMR35 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 13 Oct 2019 13:29:57 -0400
Received: from [192.168.202.100] (unknown [95.67.115.55])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp.220.in.ua (Postfix) with ESMTPSA id 987B81A201ED;
        Sun, 13 Oct 2019 20:29:54 +0300 (EEST)
Subject: Re: [PATCH v9 1/2] dt-bindings: Add docs for EL15203000
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>
Cc:     devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
References: <20190918105250.22855-1-oleg@kaa.org.ua>
 <20190918105250.22855-2-oleg@kaa.org.ua>
 <5219879e-84af-a98e-2fca-10684548d416@gmail.com>
 <2ac88d9d-afe6-9629-eb11-28dff59461eb@kaa.org.ua> <20191013121110.GP5653@amd>
 <6cd93ad2-4622-4f11-037c-9799dff4c772@gmail.com>
From:   Oleh Kravchenko <oleg@kaa.org.ua>
Openpgp: preference=signencrypt
Autocrypt: addr=oleg@kaa.org.ua; prefer-encrypt=mutual; keydata=
 mQINBFoN/ysBEAC8JmIsjbpgHCXhOuuRtHQrpFhrrs5bNNSRztXxnVYtyR5sbsEgh8dFt9ZZ
 TZ3qWFSDPHY/9AHUxoKIvonRFTiluSuLVKwM5mxgqzvPaqnekoYRafzW3hYgPcjXp+JEw4At
 vIPKGpKDn+J03c1L/vYlXT9FASQdL7fhtc0FK5wMn3biS1d9D5PnurTLKvLWmwYjWxNduW8/
 g15g4NhoDQf3syruPMSyCCXmH2CpzJXs+8VWSvySHG9wE/9QXAfskb9wFx+NSYyNdou5JxPn
 dt9XnI0MjXoc0X3IH6eBjxgIpYkVydmQnbajgxWopz4Hi6uCsJSj5z26m803cyel1XgwLXin
 uKGdWi8W/TFJy6rbbEwfeUDHr4btCPU5hZS/PFV1rsDoOxMRYlgaI8U4AKnzFZSiDvjX9t6s
 8NbjYpfYhWwSnLzJYCmi7/XmRJdJZEVWH7ZbfvOpuI39nQIuSMFJiu1jw3MMCliM0HgvuQKT
 nGUTTXk9BZfT6s53sBajFBCkIWsOK3AIzLhaCBXxWxqxE7UaewazlfB42DBm0RluvEpp4f57
 9hBW7G5HHOd7RilYobmgQ+eNQI6A9ccaeDQKonGw0V47kNROfybvT6B+XqE/s1yXQGvmZ6Cp
 QwdTL/6u57tZZdxJtHHCNfBBFoC6by2ctMBJ9JPV+1ejW9ve6wARAQABtCFPbGVoIEtyYXZj
 aGVua28gPG9sZWdAa2FhLm9yZy51YT6JAk4EEwEIADgCGwMCHgECF4AWIQTta/21JmmlO+9Y
 CVrbZRmDXXTCZgUCWg4CUgULCQgHAwUVCgkICwUWAgMBAAAKCRDbZRmDXXTCZrzkD/wPVUAx
 UudmBgLvYhBLuL0QCslD9rQ7+TSqs2FP79CHSNgBy7cXOrV0j9KNdAUmFyQqMRk8Pqrn3h8H
 RdbMNKfWfi5RsPEKBGjj01QNPuAk0L2q8noT59Rr8GkZLaSe4Toncvk+3biNjI3n/W/BkRuV
 PbMFC1F86wBuspQ/1HFht3DM+pCc1bp6RtBTSpgoGWiQSGblbnpYc0+CHsrkJwCP0ZXoi3Mg
 xAkM11H6m6az+eCPIrakdhBZJaAu2BW6X7E+IqFACKfhgg8SiuZxAmdxEC/meXn4xZECUN+5
 txjvdZWtnNWMVAhH9WbSSnRz6zUGZaxUjjuzTQ72AQEod8OGF69ZZKmWab8U1o1MbFYdGtHL
 qDrhL62Op34T8AvT9KQ+zLVF2s5NeuajnwnMsQHjnOSNvyo0GwIDYzHCI36rfEUNhAIxE7CL
 jaNOYajB3HZGYMclrrQy8ROHFQyl/Rd0V32M4rP46w0YTh6zQjr4Tb+lgMPjzlc2Ikp1MIZg
 JHTTA8MLwPrBkmZutbQ6tu1x6DydgLHGYocgvFTav/2089Y8LAmGqsHiOrTBjFmtedrfrw3d
 KnQghZnGBlRx3mL0bqsS0xG52NCYR/2fsGOma/HwqZ9yojkeBS46Uur+md0jiDahgzpJIR2g
 SkR/KZHDX+2IRzcraO0NJIykqseEbbkCDQRaDf8rARAAxwLWUCG1LxPEMHKguRtNoV2uOZe/
 8IjfbfxtVdrqfX/rKXqIYB2qJ1GcQdeDwHgzf8TVqnP3LOd2m/HkoUmps0Kb0Xi8EnUvn5dD
 ESxvlP1jwPZowq+Va9X9jziOwNUF5PhXMrM8I2xhpkqk0ZYJFke/zT0uXi6JJeZDd0VB419U
 9NmJIlwGenBUR8647gmyOp3MGG3/vFp6vkTbGedmcVWTX2107N0EsES+vb32DyvlNhtRSbSw
 5VDFwH8o9pzc3cBRs+UScRzvKJux+6RU6SY3U+VYQEsis8eVqKTQJJftwtX7O2p9gp3rNLq3
 3rt8Si4pt193VEgDSvayCocWiHy4FrXAYVv+T6avnztSC2rwtCUWZCcXh5Z4ChWgTwP7zsCj
 NeEn2ImAyQZem+Zq5Ng1dneCRfeAiaKKOQgEKMOfZYqVfqQCwIMY+iWThWSFlQ1v9cfIb8g3
 XjfdPaGQKzc5c2Bk0DIxDIx+Moa6YyYSIbw73f/8QL48ruNk32Y/REcsLEEY19GWVdBmnazF
 xG/ZqCTse/sD6URKJEVp0MLg2qSEBdt2W2gKPH6iunpUdCn8qzPklxamwu4N2EqSzv1aPmZM
 hLgH9oylg1n8IVcKrzjGvrb6aDAnlfUTCWG0fJENbB/9HhMADKejQuPA+8rNiB0BMaexovFW
 3Ved1OMAEQEAAYkCNgQYAQgAIBYhBO1r/bUmaaU771gJWttlGYNddMJmBQJaDf8rAhsMAAoJ
 ENtlGYNddMJmxgIP/RNSV/9mCoZoruMfOvLIXz1oSUAbI+gqD5PjW2ua8HRr4apCxj/MRF1T
 Lvkfea0pBZ7kwXmZlmxzCjIxvfrr6QsrF1zDaViPwaZFWQ3xkxoC5Qwr+/BurHmcIHHvAeXX
 T/5ewTLJn2/Y0TSpAsJF8Phh++Xkb5SVvRULCeX5bHS4UDlbz+gbGAoK3UKf218LgS2Pr6L6
 VfsnRcAz4jJ/+b764F+JiltEBTO4MG67DbjsW6sOg90BtPDUbtx1PcnnpD0a4L6yXpZj8mcO
 7LqbcKoL05FDa/vTV83qm3GatDoLdCiW3RE87qVeEofSpeJeh2+PYQh6f2pm7CDVmcFnmywF
 8rFXGMec7+RCbroIB+2k0LPAdAoHx99aAfHb9gKLCiYghjZbNYjQ/htdwAXOTDpcQrsiho+h
 ZEk+rkhLriLxt00N3DbwWbqTuDGVhGzS2lLmHX5lpFmkRlPIA9PUmhx2pdoOpZD2CGB0pYgj
 WySUnT8v1LQ7GLLj5iW+kqLCHEUjRjJ+Zhca4aVPZ0rjES/TYUVCB2QA+5PXTearrDWPQPM1
 74HJEvhLabxz1ovD5L7VEF0CsP4YsgJ2bNpsSZnzAQlU37POt2QUzs6FQqaftoPls9e8c2Te
 u3OCPtorpY4e3/P7kC297p4uWnvoG3MVZQfSMwzm596mdvmJXmeVuQINBFoOAmIBEADqrHRm
 5JPBPDkWuV6Encf0C2yqtX64AuMJPHMr2uLLaQpmk2z2E5AwSLnzae/u1HFhF7m2NBJYqOg1
 nMsn3mormzlhHABeL7LhT5EpfoEk6Xd8B6NZPIMzmAz5Tai1/JHj3CzxomEaK56B7EAzktPh
 QGDST6wzH3LlV90bghHbFrCGWs5wGZWqI+bzNBODFUqhL15aHUqYhECfv0q7Lh8DVYpUuTDZ
 JrPkmexlz5uV9kBnOowDkuBavGyqgbLlycWE5GxS8JveCQlO926doQ//B9mCHiF81iptM2Kf
 k7kdwLD/idt1JNdfz9Jhr0UpLlDvUj4JkZC1zLcP/dkUTcOhxD/Cwb7/wPpXnaepH5J8t8qr
 7TSgearN+8idFtNZ6br4TKA95qsile8jeQqYjNoczv6ibpgipS/wN2huUTkiORy5Darihpv5
 uYEajdvjHhxXI1G4FOpFzAd0hc6GNXt6ZfPbVSkgj01pXyfQKLTvR/4LHtfMtrr7KUWJAn7D
 HFFSr8y+wVAQ+NYnMVkKn/K1iMtZpWz7o4W6EKvTdO36sPE6z8m9tidbTQT32jJmnHrrPi6i
 US/TnN6czXaeCUgGqag2G8+kNETuvczeQ1fuzEz7ae2PWfpxnWM1wQfY0rg1NavhxK5bILxY
 2p6lo3pDncmsOEibW7cLCuHDLnGpgwARAQABiQRsBBgBCAAgFiEE7Wv9tSZppTvvWAla22UZ
 g110wmYFAloOAmICGwICQAkQ22UZg110wmbBdCAEGQEIAB0WIQQL9Mzm37Y16cWFbRDTE0mb
 bSmXjAUCWg4CYgAKCRDTE0mbbSmXjFH5D/4vb/MdT1BZ7R8NFhT4UpVrzhNKnRS941dqY+Z7
 KaSvtwv4aBXtSSowZk6hrVpccxQDIOoAbAKDIwXZnfPaFSQSgnAlE/gARY1m3VhQZRrcOcqD
 /y2UYmiLoSmCbBhRdUmhYuZSQJmGOhVQTuFP4NWqS9kOiWtoGgreqcru/YYLicfgUc9vD00D
 DiLSUodO3xBc+40caWNGK79FWhTQKjyh7IvIvpEQEVeZ1suJrH6LSPT+zlNfHVBHCY/W8UTe
 yamvY0vezXTnfgaHY1gnX2/GU6IpCbvFo8heqD0pq63t7i9HnJEu+0mfCmV3FUJzXnBwQ+6z
 UXGJI17r4r/tFgB6JQZwnU9slwLqix4KiV2rSDVu+mLRjfMXUSdbyz+VP1ea0E9/8JlnglR6
 e1fvjwpDTup56RtD3lB8sGM5xWNbTNyzjyMGj/pvuCNQWI9YqdrT8+EGbZ56lzAgy7Oecgeq
 7vJwYnVHCnPIfqcb4lScugc7zI5XcBVFIaJi9apNbK3uInkRhQMxInHCah1YdyzpTO7JHWHX
 LBWj0jA1zn56O7y13XYIeb8Tlyh4JkVvFID9Cx69VeanMephQwy7mH8E2llPBgqv/CsXIiCV
 mGJX7TUVZ6Yl2qvX8fhtQGaq+me3/QX0I8W3q8c6XtrMIf5J1IlrytiZ+1hs+K4tE932BfG4
 D/91mJ6CxLuXzbys4npafrxKcYUPHBnSXHHW8c3Y7oxAbgFT2XLV9T9tkZ1Gff8Pdnbna5us
 MUXUvulS0BykXySdPZPc4w+WzY+U5jDLQsw+D/FHohIJEHKVse6hWc4uTeW819PfNDMeTWyG
 46KXvg5492W4SsWPegKu1yAWajuQtXKBIJKbks3GG0Tt3J05XQwVEUvVIRCLmhWGwuwyO3T4
 x037kl5kBwnMlse+cg6+/3Fjf2bpAZWAFl1c6yqRDByqafPtezG87H+TFWIsObcR3iJ/5mlB
 A6BvRjHpsYCfGbVm2Z2p8pxAS8k8tJAT+JzH1wMsIyvL2UdZ9vaR+xMh4C9cGiSv3WKnVy0m
 1Vtj257XZJd451MFMZ5b1sNGlucGD1JSrDuBUZATQXBosrpp0vqYQ/JfiFWUTuZIolgz/C5v
 okh3TZo/FR5Oh9HdB4aok4nq8Ot9JAei7SZhHHtAB3R+aXRDl0v/KZ+sKi9euGvT0D9skFBp
 LAfjDKzc9y0J1q0aDQljQpgdi+CC3RzskpCK+D3RG/vKbZCASLlnk5SWWiRiCt33BfoDC2h6
 u0q8t+6HIP1VWw73qZ233By1VCEohLVJV1+cZ0/kUgkocr7aZuyNLLN/awZc0g+pj42u2BDC
 WVdfrwbus0lVCELNSvCIW2IktSytUxjQfmjBMw==
Message-ID: <d5468bc5-86a9-6d7f-1c92-1bd941ebf4bf@kaa.org.ua>
Date:   Sun, 13 Oct 2019 20:29:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <6cd93ad2-4622-4f11-037c-9799dff4c772@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="idrp4tTa9MwHXl3vWrzDK2ShbVEmPFTHg"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--idrp4tTa9MwHXl3vWrzDK2ShbVEmPFTHg
Content-Type: multipart/mixed; boundary="7vbIFitDRxxY06cxn6wbWrSKCCta4uW8k";
 protected-headers="v1"
From: Oleh Kravchenko <oleg@kaa.org.ua>
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>
Cc: devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>
Message-ID: <d5468bc5-86a9-6d7f-1c92-1bd941ebf4bf@kaa.org.ua>
Subject: Re: [PATCH v9 1/2] dt-bindings: Add docs for EL15203000
References: <20190918105250.22855-1-oleg@kaa.org.ua>
 <20190918105250.22855-2-oleg@kaa.org.ua>
 <5219879e-84af-a98e-2fca-10684548d416@gmail.com>
 <2ac88d9d-afe6-9629-eb11-28dff59461eb@kaa.org.ua> <20191013121110.GP5653@amd>
 <6cd93ad2-4622-4f11-037c-9799dff4c772@gmail.com>
In-Reply-To: <6cd93ad2-4622-4f11-037c-9799dff4c772@gmail.com>

--7vbIFitDRxxY06cxn6wbWrSKCCta4uW8k
Content-Type: text/plain; charset=UTF-8
Content-Language: uk-UA
Content-Transfer-Encoding: quoted-printable

Hello Pavel,

13.10.19 19:47, Jacek Anaszewski =D0=BF=D0=B8=D1=88=D0=B5:
> Hi Pavel.
>=20
> On 10/13/19 2:11 PM, Pavel Machek wrote:
>> Hi!
>>
>>>> Regarding this ASCII art - I presume you wanted to follow
>>>> Documentation/devicetree/bindings/leds/leds-trigger-pattern.txt.
>>>>
>>>> It was added to bindings because we support 'pattern' value
>>>> for linux,default-trigger, which in turn looks for 'led-pattern'
>>>> property, whose format needs to be documented in the LED bindings.
>>>>
>>>> leds-trigger-pattern.txt documents only common syntax for software
>>>> pattern engine. Currently we don't have a means to setup hw_pattern
>>>> for the pattern trigger from DT, which is obvious omission and your
>>>> patch just brings it to light.
>>>>
>>>> That said, I propose to fix it alongside and introduce led-hw-patter=
n
>>>> property. When present, ledtrig-pattern would setup the pattern
>>>> using pattern_set op, similarly as if it was set via sysfs hw_patter=
n
>>>> file.
>>>>
>>>> Only in this case placing the pattern depiction here would be justif=
ied.
>>>> Otherwise, it would have to land in the ABI documentation.
>>>
>>> You are okay, if I move it to Documentation/ABI/testing/sysfs-class-l=
ed-driver-el15203000 ?
>>
>> I don't see if this got a reply. Yes,
>> Documentation/ABI/testing/sysfs-class-led-driver-el15203000 sounds
>> like a right place for the sysfs description.
>=20
> There was no explicit reply because Oleh sent the update with this
> change before I managed to respond. And the patch is already in the
> for-next branch with the file in the discussed location. So the reply
> was in the form of my later confirmation that the patch was applied.
>=20

Anyway thanks for reply.

--=20
Best regards,
Oleh Kravchenko



--7vbIFitDRxxY06cxn6wbWrSKCCta4uW8k--

--idrp4tTa9MwHXl3vWrzDK2ShbVEmPFTHg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEC/TM5t+2NenFhW0Q0xNJm20pl4wFAl2jXwoACgkQ0xNJm20p
l4yNjxAAn1Ls/EgEIPFNGc5TxvAQ2tnSM0DRyye2ZS0j4dcQNwTFvuhHYRnQ8FB+
TJaX7GKs24AGI5lpe4q7It84kqzIn76wEeej6ij+iWsRuvp3ru/3M8TcIv+Fh17C
mIqGHJ/KP8cjQScEMPFbKPdnmpHojJtJWbVxf5WnsmJAo43UHtoju10hYCJqb4oA
gdgZyJF/JQwbGNEjicjK8Cx8GYVh5quGGz6KHdqANY+TYq+sCVAKC4Ka15vdO7aH
qrCoSBVVPHdis38DcFsRIsiGV/hhVsrnk38EsOAztIKO6MEe9FMZsynyiK+YJlFd
QV0H5E86Mtrj2leP4Nw1AnNLeOUk6VeWVZi/Vis80C7RyAxsLx21zdkyNuGns2+R
98Tla1W7JJxJSkKcZChSP9AyTMbHYeo6Ql72EdPFVhAIYYPhtNoZ4EY2vcMNBxE2
U0TKQuOH/g+C/GOoOP0bbsKEKH3YLXy8BfFrOUmH+40a6qw2LTPxEKMHkeVNdJAK
7tfGylZvlE90eEI/9iyHR6XTr1F64vnauxVPffXsJITftAIbSZueMMepp6EQE8y/
3GmJ4cFnitLSjFp0q4blVPQuqLSzcMDwg30NXdWV+ekzSt+rMkMEZPYfcBK/mg8K
EHFdUtR+I4Yzb9rsQOEPX6WDofRCUMX6d2i1c47+kV90EXhx8gs=
=Mnf7
-----END PGP SIGNATURE-----

--idrp4tTa9MwHXl3vWrzDK2ShbVEmPFTHg--
