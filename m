Return-Path: <linux-leds+bounces-5608-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56075BA657E
	for <lists+linux-leds@lfdr.de>; Sun, 28 Sep 2025 03:33:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 12C373BC4AD
	for <lists+linux-leds@lfdr.de>; Sun, 28 Sep 2025 01:33:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC1B5245020;
	Sun, 28 Sep 2025 01:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="I/DZ329g"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1297124468C;
	Sun, 28 Sep 2025 01:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759023202; cv=none; b=swzIWLhBZcc75FmC/SnV1r5UcCHf+YdAnNVFLtoNb/+KLI7AmzKcnwy1NBYx2sRhfRyBf9WdgH3JCsjmqyQzPFR5JXAs8PEzlYGw5e8I9AzW4Nh1ezGnrXsnbYo4IF+TKBPNU4dBP65VtDOXiDSa/xOEC2uLkcUbU1kfTuyEniA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759023202; c=relaxed/simple;
	bh=DJGCZXfpCZ8yGEIdk9Ayv+6btxIgDm+lldI+on6QVr4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OWBVXrgfMvEp/9OPnqKt3V5NWiY1fjAHosrEsVMMMK9PQIdleURI/hE6AzPHa76pSuaYm70f4c9VqdpET0oNwIUZ5Xa3CA59BEi3zjHBrUsYqOzZnuqRU4wJBYA5dUYu1yL6QsgyReP6SS8roRofocISPdexDHwAdPanyVYCoIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=I/DZ329g; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1759023193; x=1759627993; i=w_armin@gmx.de;
	bh=/m6Kon3V4rihxFv0iXr3NEJ6fMTRsTEqRDMnhm+25MY=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=I/DZ329gZf03NmIoSMRxuTOifBT4VaFjgKszoM3PGa+nhc5O2sHI8CJyPBWd6oA6
	 Tl4w7o0FP7KS93fh3cgF4XmjsWug+aPzHjUnm4nSlQV3qbiHL1yFgZ7/sq/Y7xzvV
	 hfSjRk+jLDstzfIpWCrFeYL2/f2AN1H9KkN7D8vRK33oqsPmr46owxppah0PyFthf
	 Z+SO0163ug+OODtUs/v6mop1cUciJmPVMWaEjO0lYUBoYe5o82nQB1sGO9IzURiSD
	 TCm1SQGtr1YtR0xlPVbfA1Z6X2aSq9xwZnPZDjWiEZqE7cyc23XwvhIDYqfgSZNa5
	 VaCFVvLu/FV5lhM2fA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([93.202.247.91]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MQMyZ-1uh0fI1MCP-00HlE5; Sun, 28 Sep 2025 03:33:13 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: ilpo.jarvinen@linux.intel.com,
	hdegoede@redhat.com,
	chumuzero@gmail.com,
	corbet@lwn.net,
	cs@tuxedo.de,
	wse@tuxedocomputers.com,
	ggo@tuxedocomputers.com
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	rdunlap@infradead.org,
	alok.a.tiwari@oracle.com,
	linux-leds@vger.kernel.org,
	lee@kernel.org,
	pobrn@protonmail.com
Subject: [PATCH v4 2/2] Documentation: laptops: Add documentation for uniwill laptops
Date: Sun, 28 Sep 2025 03:32:53 +0200
Message-Id: <20250928013253.10869-3-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250928013253.10869-1-W_Armin@gmx.de>
References: <20250928013253.10869-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:tiBAdwIPrGnWVsD2jqQIN+PquVlbNzXwWLjj3eUR9D+sryMggy+
 YzjTr7hpbGX5pTu1cwFeSsX29wYc4aeyuUjom72EukZ17Qz0m47B6X3ni7dsPlgV76LKrRC
 EZwUSewtQon13M8GgnIRuE3/mBL53bmq2ikymMlBWWKxeBfEkDUALtUjBLSXjZb4hDuQ7HV
 zmItT0A0+jHmUi8gkMNpQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:CaL+NnrnQBY=;dHhLFU5FUhekS7TfoOfCSyX2s/w
 bXH9o4dEd5XP7CYCH8/29pc7U72RtDLeyv8n5jSFTpIDlScq1g9X/JpCu9RFaxn3yNQtu+A7D
 kSw2hulrA5Jh9HpSYbRGulg8AX69omrcR3N5O6P/aj4hAWk7uqgiQ/5PzJ7YVthLkg1GMKo26
 zBQakp6335IAiLZJHXoqLd2vjd5Rlcgo5osGP1BT1JcfUbPfT1CWtScbTlNvRDlNaNeuhVg9b
 tq7LotRiCrjZTNRAlosXPqtThhTnMaTDWlxz+w+QBpGQzi8PERlAb7q9POf3i0onKA0cumNAn
 0rDcRvoprCXm7ZKtQ4nKhbRUBTj/R/m/lQir0/eFABaIhLvbNyX0kpHPFeQvuHBGmDHzzXkKg
 B713/fuRk7ICLlCP1CX0eMoEYyF+KWkvmoIYAFWAvApegFhxyEPDACWFpFqN90qXI1/vjZIv+
 +5e04kZTKvq7jWahcLSumUP9N3j5Ry9rY9Lyfaq6ZCICAhJEqUq94NM6ISdzmEsE4CpPttfQd
 a+efErxzeRXNGMdnqQeV8c1Hn2S2yCa4jKnQhCIAzk9IfISnmSBS3OvejCnpxA7TE2SvNfOjg
 FNcKz4U5HeGYi4BcXgoR5e1BfeO1GqXxtYz6MdUW6e+P25yLb67oRSm0mEvLSxgkG9L9z7h66
 nHy/4IchmXS4lOCgeoUQt5/kxl+4I4KzSpIL9sBCxZezHvC9nJW7i+c36uZS7oMKLcj8VVd8n
 i8rs5K3WvAZ3i98osMu26Wl+oD3dDZhSMAFpwwZ79DsSFnWMHox/J9LcPyp81Shigr75zdjLW
 +LHjdfCPdNhtzhMlK3iK2ANUQQupHNiRRJMF8dYZCmPwtQy0Sx7E87J1c4Sv713KGBnd24eJm
 gDKTxgBWxxxJtcl6GSoQljcJUAGkT1d9cx35sO70MxV5LFDm6oo+K3IQYkabKUkml5dfx9QRq
 ovmcgqgX+lnqXtU3Hk9ahxGsKw2YkTEfBOUIQ6FSQ1CEwMRI41NvSGWnPseQcXMf++IcFmSMf
 8S2VnRTEbG9Iglca151Nh/c389dNN4jRmbrGkcU6ZOLEflNrbjwAVx9Wju97zliHxAiV2jjkg
 oA4D4sJCL+lRtzOjqIhzSn37kY1CWm9fa/RrvChv/nnHba9vKuZw2EwTuRjOUUeW+hkeBzsSl
 5LUnK+eW0kCNUfE8dWYaoklpIIhj6yhpcGaUr8IoPy5CE9H0VMewOlSVXro9zI9g8AgKuESP8
 z7rQIymT5KCqRg39WIaulqYBqXQG5X/2oeC/Yzw9aTT6occQLR5fAe/ymjNeIP3KamWm+sYHi
 p6vCbrZAoUUVz/C+hd/wqSMnbZoZHuhMcNIGymxqskSgy+VTkGd29EVcb8SSJrmqZddsey6v1
 hF+NWusSa+cHMz560XR1DeHr2BDO9zRvP6Vt4nEchPVSMk53XvY5/xQ6Pi59dBGbv1ShLIJcJ
 pAg1dueHYpca6ZRd8IWjWyfjyn/vAJ8va3eBv5QKAK628Lr4WAi4+Yx4beiujx6L0twzRZ4iM
 AARncCv1Q8pFcfo9KJzNmWGPY97WvGspWwttihSq59x/ubZT2IjctgDmYRmIlwVgGAXDdGe/G
 0OgpwQZ1wDcsAaV2gnkXOHT4pa37CuoNG8VajXM3oX1iP3RbnVO86e5M4tVxdEI3d7PRYFbH8
 26TbOFhW16+za0HklAIZGaklXaPmebfj+Ub21O6mHvd0LyeZ4h8TYUKtVanmr7Gb7qLoosS7y
 FNkMD36bxaZ7Bv7obZ9q3TeufHxf11FdT2Y/HOIrr+YtG2CUvjubKi/DE3CeMvmAdqTADceoI
 9fxmK0N6sFLLd/OMiDKi6xlM8jJkr17fwUuGdqIP6zPoW7bJBv7jT3WoqaUuaBpm+P3vQ3ejX
 nrm5fdyI0ukjWkc4lLdeNFEQ9jPk3/AVZfjHhYevdkYFrlRfp5z3QqT7Fdkmdayfaz2ZVRG/u
 YUsdm25eIDHo/AMpqLlNbCcgULf+q/i04oK5eZU2dmczcZzdGCs8DBG7420CmqPRZ77cMmKC3
 z0r03OaJZjaAUoeKL8t+r7dS+sD552H7H0rWxxpauzkiGJ4ti4RGWUI1l4Uo9vFrb9wGMh2xP
 6UF5za0iXtAll0fZ8I1TO6XxWeaf9BSXDDckVt59YY5WlaG1HrdPyrIhZLH8P+27jkd/BzOpc
 bf9tJrh22sqZOkQrBbjz7fv8K0hH4qryIchBp6StwIUD0G1uQX92N9fidTovS19urva9mHdMP
 QSJdwr6M2LNKr4HSmesxmdNZwsDPHx5+VeB52ATLk4sb5bcjBI+jsj84U5qzRmrzEeRrNoFLU
 0c46YKN5YtANbivSroNmn8ywfQH1IXwl7RM4rpHWI3Mzf+mfaRmDdNMXBXmJdPQ4uuqqGGq8y
 +gykmSDSRoneThPJ29MSFgqF2C0m6GLyHpFtFvD+75vHKTkB3fCDiJauzHRVeUjPm8oIYsc/f
 33PteAx3Wh5qGOfYtHPplZbGps6z1jXSeNq2VtuAeqDWr/CZciIhSuO9sbMAsgYF3R+0Pty9L
 jhyrznf6csu1/tOHCuuxcFR6semnv7KRMK0YW1UysfA7BamvHom+jb8cazDt/MEaE4byZ8hQV
 nLBCRamO+RH+xttkVmt2j1xFNORVb+Ivkw9FjxAc6JguP71tNInzzfmt55HxBwJZlUsi9ZuU3
 DpnUyyR4nnYh/175qV5mDE8xGTCclLFR8IPrjlGbdujC+6S3t8zpw9rMS0PUhb6IIF/7XEYgF
 d4urtAMJj0+qXD8GqCYbV3SL4B9yYhjpFn6tqhxMfAnN/8Yv1HbGKHTVg6yEOnkH6FruXIpAi
 DKThWeCFT1X5zRs3m0xX0CAPfJ0oph42GDbbmrbN7S/MPmlDw5Bzp4T5IqL7zzy2RH2AUEpzX
 zS5oc3JN/a3Di/23WrC9qzLFbLrufYhbhjEXW+JdrlPHQ9xgAMsm9GXtu35fbfBk1MFhLQyUA
 YDNrbXgm0Jmn9t4QpqkLUjKMz88OwJwj/KzQc0gtn0nQxabUiDvtxBbbrGj4lJWX+I80GsGD9
 MmcxfcOXtsmiCOKxFGDH9NPvvcD14YwOM8BOCGqbbtTs2ISTxxbLBH7+F6Csj8cmV39QEPcdH
 fjEYhctWw3xKbMraKK1c0jxln5GR5jDx4DSclgju1q/DD5EX9VLLCKrev99iJzeMoF0QfoMla
 5nNRYqmHnWdhiiZncy4lSoMrDVkVNKu0J6779BdueiarvoPn8+ekHUKP2MvFUEbKTxnbWLnp6
 lEm0maagIePIXoPp6nmfNzm+TIauWJPlQhiPaU6RFm/kRV8PibPD8c/ZkUWyYaWRtHNXfjWFK
 nC0S6bOqfZfXVaj5hSKbgKzAl6zbHieE8YKM5WjY2ImAQVBd5KfN6Z2VM9AwNZ64fO4WZi07w
 8wmV087+91DG8rlvrImwP5PRAKwGDs3zvAy0fu/uxovqW/bG3qtrNKtt9YkAbdUX8TDmn3wAC
 Du2zZtLfUvrPiilRuX4mB8Eln554R2VhZGUhSItlkwjA17DmzxpZa5ksHEf0bcDwm7SrIfh1h
 4Ws9+O+CAv7xCzyy8FKbk0ppbFrffSEw9IMbBIR5ADeVgVgeqdVkt/J8AYSO4t5OrDz+hI7ZR
 rZ1A7+qDE1WOy0VSFaYnZP9lviaGGueZ2wki1KSOJ68rO67XkMv/4uV7IBzKnYGGRxC9BX/B3
 Bon/rWGbU7uVzOhEK5mcDJBBNwbzjrouEkiGXTRbgIzPe+vTdcIQ0v+cCzsT+Juh1N7vZrXz0
 6Chwza2oBY9aTdwH0eRbYQxRFfNwSqAdrsb5E2YHpkjVfBNG/EJRVu7J5XMohupHN8yjfDvVI
 LLeJEYvp78oNWaE7kUJbnBGGuGK9GSxcNTqsqwqNVpc7w/88nhSWYNm2uSJz+8uxhgWCN+0Ix
 iHRAjBg7+vhHofTuGrj2ri7sFlKsbCztX6jZCHDUEjwpUZBAnIx3mYuV5VsbD9zPsGMMs7dtI
 owNoh41F/azYR1hA0ovgctIrw4lXidmI7o82RUFnmriURZcJnQElsfJEsJgiyGhjHQdEV06Ee
 /0pBFuARwxfTQ4oaa8dTdU/h84gplnbWg65r9b4D/wD6m9LIiKU4pEr+8SMbTlMZZw+yW/U8E
 PXR7pnVs4D/41YDrrUNNmlfSJf4csDG5aHFcRHNNu71+EzCq6RyNr+4ALdkko6kbqTujoPfDx
 zkegP6xrb++U98mY9xgx+GH5eDkagG84IcBlTdaPjy08ClWRpgFc519EFHISGxVj1njQBi7Pr
 tnNPRVccEDiyjRN5Fs5EyY997FqesI+POtrF5yeNHaO5l3nN67P93PmmEv9BiNPk/NSw20DrR
 2FWV1C3qcLYAMbkjExfxBKoBeBo6ihoDXRna4//MDbxXee5DkwY0m8fT4jcntxQ/vpidlgClb
 AHUiEiNb+gbiHr70vrwuh/yjm+UJM2RrLksesLLa3oSixD5+c9uRp+nTQn1UeVDliy/RBC3Wq
 FGTRZAG3SDTlCMQHjl4eCCaxX5fErwPLqkl4wgbz00LLnvxUsQ5b5k5OJYicS/Ky2WC8vLtIN
 TP+yPXfHTMkq1ntsB9PJJ2XGiflbGZg/AwB0+DZbM/pyS1p50PMRup6Zm82+G5ocbZt4Q7gSy
 hQtssMl7d9HdMfSMXU4I3E3AUcqdaBNCg5vVy/MWFwfjJXny4xcH2pF2JcvjOMDOsO6lthnAd
 9ainyHErCpLSWTqYlFbj+l+fL3nDgVgLJiAfzif5cEAg+n3OST4WJk5rq/PCY6hpKCnIJz4EQ
 vU7g0DR3EQMENPxH3qCRpwd7oCg8o82HEBsAfDNn0fFyetHkFpHjzJgQxpT4IEg1I15WdPePS
 7aDzOS/guvDZoNgGDvwlHdKjE2404VGCJ06aC803bBH/+Gdqd8b4dh8xeM6WDXQxhuA0On/dm
 q/0hgfwxZy8aIYODgHx9anC5C70mlqTb6U00TMTu8ScozMt2gUXuJrbHk3ZO98TZasvj1FRbS
 g/CLBy9KjKZiefMBQngOS++CwyedzDFT6ko=

Add documentation for admins regarding Uniwill laptops. This should
help them to setup the uniwill-laptop driver, which sadly cannot be
loaded automatically.

Reported-by: cyear <chumuzero@gmail.com>
Closes: https://github.com/lm-sensors/lm-sensors/issues/508
Closes: https://github.com/Wer-Wolf/uniwill-laptop/issues/3
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 Documentation/admin-guide/laptops/index.rst   |  1 +
 .../admin-guide/laptops/uniwill-laptop.rst    | 60 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 3 files changed, 62 insertions(+)
 create mode 100644 Documentation/admin-guide/laptops/uniwill-laptop.rst

diff --git a/Documentation/admin-guide/laptops/index.rst b/Documentation/a=
dmin-guide/laptops/index.rst
index db842b629303..6432c251dc95 100644
=2D-- a/Documentation/admin-guide/laptops/index.rst
+++ b/Documentation/admin-guide/laptops/index.rst
@@ -17,3 +17,4 @@ Laptop Drivers
    sonypi
    thinkpad-acpi
    toshiba_haps
+   uniwill-laptop
diff --git a/Documentation/admin-guide/laptops/uniwill-laptop.rst b/Docume=
ntation/admin-guide/laptops/uniwill-laptop.rst
new file mode 100644
index 000000000000..a16baf15516b
=2D-- /dev/null
+++ b/Documentation/admin-guide/laptops/uniwill-laptop.rst
@@ -0,0 +1,60 @@
+.. SPDX-License-Identifier: GPL-2.0+
+
+Uniwill laptop extra features
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
+
+On laptops manufactured by Uniwill (either directly or as ODM), the ``uni=
will-laptop`` driver
+handles various platform-specific features.
+
+Module Loading
+--------------
+
+The ``uniwill-laptop`` driver relies on a DMI table to automatically load=
 on supported devices.
+When using the ``force`` module parameter, this DMI check will be omitted=
, allowing the driver
+to be loaded on unsupported devices for testing purposes.
+
+Hotkeys
+-------
+
+Usually the FN keys work without a special driver. However as soon as the=
 ``uniwill-laptop`` driver
+is loaded, the FN keys need to be handled manually. This is done automati=
cally by the driver itself.
+
+Keyboard settings
+-----------------
+
+The ``uniwill-laptop`` driver allows the user to enable/disable:
+
+ - the FN and super key lock functionality of the integrated keyboard
+ - the touchpad toggle functionality of the integrated touchpad
+
+See Documentation/ABI/testing/sysfs-driver-uniwill-laptop for details.
+
+Hwmon interface
+---------------
+
+The ``uniwill-laptop`` driver supports reading of the CPU and GPU tempera=
ture and supports up to
+two fans. Userspace applications can access sensor readings over the hwmo=
n sysfs interface.
+
+Platform profile
+----------------
+
+Support for changing the platform performance mode is currently not imple=
mented.
+
+Battery Charging Control
+------------------------
+
+The ``uniwill-laptop`` driver supports controlling the battery charge lim=
it. This happens over
+the standard ``charge_control_end_threshold`` power supply sysfs attribut=
e. All values
+between 1 and 100 percent are supported.
+
+Additionally the driver signals the presence of battery charging issues t=
hrough the standard
+``health`` power supply sysfs attribute.
+
+Lightbar
+--------
+
+The ``uniwill-laptop`` driver exposes the lightbar found on some models a=
s a standard multicolor
+LED class device. The default name of this LED class device is ``uniwill:=
multicolor:status``.
+
+See Documentation/ABI/testing/sysfs-driver-uniwill-laptop for details on =
how to control the various
+animation modes of the lightbar.
diff --git a/MAINTAINERS b/MAINTAINERS
index b4623730a41d..cbb874f3b0d7 100644
=2D-- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25920,6 +25920,7 @@ M:	Armin Wolf <W_Armin@gmx.de>
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	Documentation/ABI/testing/sysfs-driver-uniwill-laptop
+F:	Documentation/admin-guide/laptops/uniwill-laptop.rst
 F:	Documentation/wmi/devices/uniwill-laptop.rst
 F:	drivers/platform/x86/uniwill/uniwill-acpi.c
 F:	drivers/platform/x86/uniwill/uniwill-wmi.c
=2D-=20
2.39.5


