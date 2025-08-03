Return-Path: <linux-leds+bounces-5193-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7FCB1956A
	for <lists+linux-leds@lfdr.de>; Sun,  3 Aug 2025 23:03:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D378F18932FE
	for <lists+linux-leds@lfdr.de>; Sun,  3 Aug 2025 21:03:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A94F520F063;
	Sun,  3 Aug 2025 21:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="EubrEoOp"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F82F20B1E8;
	Sun,  3 Aug 2025 21:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754254981; cv=none; b=S9e13CJU0LfSA+RjUzcTNdbaM0jjXPWthNveZ+sMGXQ1G8IGUMtRxDS89+u9Q7Bb32jcVEpI5Wq9aJYJQAuJNIwtfHgJEynsDuSOPv/+iAO7N7kwB885b2emN9Jlcpy9kA5DLjghQ+eAlso1E06KhVS8Uo1BoRW6vJ2KmvWMzCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754254981; c=relaxed/simple;
	bh=r9vit6NjexpH9K6wh4FHnOHtqvh4NGndMUo/s4RoAqo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XifdMivQrPwPGafnrJNDktuXKiSbEw/Y/yD3NKU074WzN93+18KqscI3dzO4PtJASwlT01504W0EygDmRcotqUo+0pcOR9Dz6Le40x6OCRwn5irOzZIvEJxtO5H0h18jbRcNkDLJM3Emfs1X5WaQrj4kGdOuKIpmvpWZe2MKMlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=EubrEoOp; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1754254960; x=1754859760; i=w_armin@gmx.de;
	bh=+HguzVaZjQwCRLHwPDHCswjzYiuTBsCiRdUvMoXWxvM=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=EubrEoOpZNM/BJA2UzKa0wlwOWyPzA8U7zeQ2+CE9da54hrBitJQZ8gF86ZXD1Se
	 tpooGuKMmZbPG0O8QHHM13IoJaDmERwt1Q1+yScw7nSozloX6sAvLqKvOnQxfosm4
	 C2uUnRZ9JTLPAeaIoKPS0knC02kdhu+aYtXZ2LvmOV+9CLND7k460jiQHESpralwq
	 LL6Lfk+rubpreW+9ndkLNlK0uzsYqE6GgkY2V7rQQ5DZxoUoifomYjBWk1fYHgi2j
	 1K/GGDJRbe2Pev9f5qDe04Ni3KHZwjggBYzWqytSKr+XyfaZhTJRrKnDD6dAXyGBo
	 t6SA0eBk+oQ2Z6PRWQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([87.177.78.219]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MCKBm-1uqxJC0m5i-00EBYe; Sun, 03 Aug 2025 23:02:40 +0200
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
Subject: [PATCH v2 3/3] Documentation: laptops: Add documentation for uniwill laptops
Date: Sun,  3 Aug 2025 23:01:57 +0200
Message-Id: <20250803210157.8185-4-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250803210157.8185-1-W_Armin@gmx.de>
References: <20250803210157.8185-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:7WK4/ICtgPlNP9j6dR+MGRI9cu8WAHkqMvR098ChQhwhtQCVj8n
 hM0w5OMl1JLiJPeLfG52Q06OSCgrtgLeBEcUtFsp4fffszAxhCGFFBNW0Abtw8RWZop2RN8
 ce6dB+jMXJZQKeALRfe+37HRCaPwLUCdG2eSmiSQF8ldO3O2G7xsEQhc8PpUm0t8/vZ+xNk
 LwaMKymyZzLL3No+47xiw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:o+J9Q/TTcf4=;e8RT/l0AVQxXjP4T44Ye8o3BfOL
 Fc5dVDLTpMXSIghDOas4IlBD3bxJIAzfm0lv6doObuAUGRVYnflt/VxfibDZokoIWDXC8RrlU
 0DbHOdhIoz15x5neJOfaE/Yb/YdtyArwI/rffY+SHIv8LuHwnkJlzNsn9tYShUK8jm9MJMP73
 G8MZGkYE2jIjbR/EzjTpL/3+BPChhZtjEVzRVU/qrY31R1QsTxbR6SSe+AECjsRg7UMSNNDal
 +/tePZEjLgI4qyDRzkRpSs3PZD46sucGolVo9T3vCZAktXBLHRjBZcj04Rzb8RoJfge4Y7jQt
 vuNdJAsAWCsqHKzCv4R3MnTh4p0Vf/CKz5U2v0+myJD0vxPmJWnIvcPOSv1s7fTaQfVIJL97C
 HTmPJi/rH2wD16RdWhJXgskdZTAGOyudnWTKaXqbQexk5QQXyxziQS1JooV5w6Adxj4Pz8lSW
 g+3fJmF12h06fwWSF2g/XY0BiBEh3DL1FeGs5lg2PkskCqBKZJNIhOmMRFefPqHQOLtVMJd+V
 IgoSaJvRHcJPgvus+GDdqWHsWdd1d6qrdEElNIa3stMkDw+1mkPPb3BvvfnfMPzU4Otqdu737
 6IHzfKoETTaLpJKcIThdeg7dH+pru7pREktXc3AP/KKz0oUUYT+sn+Qc5Q0WSHlMTbuXGJMbP
 3U8rU8S3TOJm2PnlWEfUIoigHU38QSoIEom3SDXP2b6L3zgWaGCMApMniLzwE+b9H8cxYwBBZ
 u6s5PW0OhrW9BrPvOVx2wKpLiOPZ5UqXpPsZJ2XPlnnaFzbBsRRmw2Eo5a0+2EUgT7FOo4jbA
 5jPw52Z3M9KneOz78ngUf8clKfdaj0iWOlPo/a7CEH3+LiUSgPobHAQJK3bFmtGFT7JslZHtl
 3EhMG7s/GWeQigVXkYC71/8AIgem+gvsmmuHThpHEjJvnPTEEw8GqeIor4rrLGc1Tdex3wPss
 9thKDRrht10PnzpL9qJUk8bSpo6XfA6jzNSsM9EkM11ZpgkDS+Phwyferl1/DMF/g/pReDAM6
 XT7NULU8LD835nhHtKw69arE3bFqKwHYWC5amazd3qyWDl5j9jEMRTePhDJ/DV7q8F331ERYN
 q0xmYA+xxMkssnbCqTYlpBjioSa0RIKW/6eaz5I/ojV1FBt5uaKmafVC5VqmBwYDFhXgu2uA0
 72LUuczttqz1j3LUk+Gn2P5/fwuxUr3+XoSCYJ/dFYwqfws5Nmkfg92E8i0DxIyd+185d4p/v
 rYVlxaEVSX4Jo8OQROu5hAMPAg2QQEbxcGUly/dzwR4xPujWU3v91/RJR3zfUE9JOQ2Dz+/sJ
 /GvXDDwECymlYYqqT6CZ+1wwLMvMfa0Yz7z1iJsV26A5Q9QNl7T4wXwGpmoPypPY+dAIKV/m4
 NpzlSDV/8nNsArfOnUs06yB6N6YKJs3ovEIcRwB7qTGwOFtifXsZawScgbtxxLPtqehdnKD8F
 RuRU8lKauchfwcqzPxPI1z4e/anxbf0sJuXYoxKzT011mBRhCCLDFwPKukwzyfuCXyA9/TUAV
 v0ZCYCiAVo62k+XED+29yCFeJTaid13IhNpyM1jyUw2PqDxL9c1lOT6I7obCJ+u23sfaHeamP
 LWySPXM8rtyHPbk12Yssicgevar5TfEFmwaStsLK7G9LpcCTkD1wbyZdi70z/7ViwiC9Tb2k8
 V/HJshSy1dq9tcexIRiEetGhb1RRKMG9UTOH9DBNiFVc8EFUbISNCDcO8qtlIcqHRYqBJqUdT
 V2CB4tbg66cR11bfQansWrotiubcZDEtDYITl/BSF4aCUqkjljq+Xcb7pGAbziI9EhNLnN5gm
 3VZU+OfsTDgspx50Pb2XSF1Efy5NYems/asMHY0n1zimLttoj9VGteW8p/v+mTFEP4sTuQZXg
 6ED0H4VAI+nzz+PwEq8zFQG8X4LfCoXxYDz1OY6+FcNUULZPBF8ZrNlmnlwU61B1P12bCC4/L
 pyRp+WkwV2yT1EpvegIedQ6BhwDVArY4OneDQIdqzbE3AoAbjikccecohw9Xj3sKh1q1cylLc
 inaeudyI8ixVW1loquPfza+K6r7NADKzXngJM/qIw5Slxi01lw8o4qxjubasO5mT1cXRcWy3/
 Ahk7yO1iW2mJc6O4RNpHG3tI69KXTeETVErfX5x+N6HQYLDTUUZGC/71znJ9dGqjB6/6CvylQ
 BpsQugZbX21xrzn8lY2KHjGURi418u4lFBGU/wdpZqKRDaCcipSohsD5wrWrkNK0rW/TPjbnN
 //b2MNxSSBV1eLqTArDpiExTxfoMjrxWgEEUGj8bl7txl3iQ079T6G9HkacN+eull0ubZeCsq
 aWow5/UNqWCwywKrYEhIygp0SPWC1SathUbVG92HOOuUanSJDScC2poosUnX853tfB9WNbxkI
 DBbloQZXME49Cbmp/FYz8FtAvcY/QSTPuu6ZaUTL/A3ZIygVZIKb6hR/FNfVSisv7CDO5yqR3
 T8kwCmPrdJTUu8PhgOWSFWdDNWhTHVgac85hcYgtXw4uqPakGT3iRBFVAp+CRVo8UDaD0cgAS
 ilU4EoUVdZeLLdkntX+xdaei3lCqxzPXiCIsYgKAk7gcTzSVnUhfIWZNti7q5l8sO6MawyQCq
 NHYPdrDHtT+v62zAvMJTDjvNdyLu1bXFuosaQLRL/nw1lBrhz1pmGshxDLnjYzxQfH4yBpdnT
 9aNCHoP08xdk7TESi7HuqpwG9+bryhK4MfW7k/DHsSkYkD22ft3WnHgrZTs5hQd6VXQC5GDNj
 +X1o3YbprFI2oy4G57tsoOY0omX/NK0wLgMNnkjWBGE0/CrjENjEHC66TJ1b6HHl0gjC0A4QY
 m50wx9eGXU+MJobgukbp4rjjLsrEeZoFeAN7rO5AFRNSOT8bQoHJUSzGl9CGH2oBv1vnLVGwz
 XkGrRTWpAtQPA1D9c/A1kBpEYiAuYGjtXp7bLek6fmedwGk2Wk9mccqHktMTYisfTdyXF3qXy
 RegBWZwe+zn4UWVOXnihGWwN6doqFleIFjtp1WH0PHgD5XV85IhAm/65P3MATmgUgkUDuEkwa
 WQtmvnuVTezoum+qLuHGf2QcfztIk6WQhMAZ5Ifzs70fzY9zsUE77c6fboBlqKD5MOK/+VoT5
 21xD/jh3oAUDrGZQN1aKCvQowSpbib+q4NCBBazKq1ErHRmahdYUX0x5Hfbo7YOwKjG9FILdP
 3EN7WBttmQuZX09G1NMbgkpQ4CuCoSq5S5P3OYv6k+cldkkfrAnoVvWgmTBYC7lEEyd0Unm2H
 TvUepHHyTYP7Y9MiIJDQcfnuZNiLsTyv5xlwh7VwJgRdv8OLc4r80vn0YkEew6oUxJMGuzxDX
 NVzjSEjh57FOh9zS/oLB1UD0eYsd+7axx0jGEzUbgGOL6AAsPeTp0AiSZATH0C7/9AsbHPVtH
 h9/H7QtGVp9amLkZ92Qzfa7SrHGNU/JxWhwa0Mmb5jES2yKHjQJoxp3wQkdIW1F/t9VKoOnPf
 zICMFX/Np1BcIvl+gUjpMGEyE1EspvIhKjSVmEQtOVgPgITDTgEWxHdQZB/egnT79mDRZiPrh
 Bg==

Add documentation for admins regarding Uniwill laptops. This should
help users to setup the uniwill-laptop and uniwill-wmi drivers, which
sadly cannot be loaded automatically.

Reported-by: cyear <chumuzero@gmail.com>
Closes: https://github.com/lm-sensors/lm-sensors/issues/508
Closes: https://github.com/Wer-Wolf/uniwill-laptop/issues/3
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 Documentation/admin-guide/laptops/index.rst   |  1 +
 .../admin-guide/laptops/uniwill-laptop.rst    | 68 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 3 files changed, 70 insertions(+)
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
index 000000000000..890328273c9e
=2D-- /dev/null
+++ b/Documentation/admin-guide/laptops/uniwill-laptop.rst
@@ -0,0 +1,68 @@
+.. SPDX-License-Identifier: GPL-2.0+
+
+Uniwill laptop extra features
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
+
+On laptops manufactured by Uniwill (either directly or as ODM), the ``uni=
will-laptop`` and
+``uniwill-wmi`` driver both handle various platform-specific features.
+However due to a design flaw in the underlying firmware interface, both d=
rivers may need
+to be loaded manually on some devices.
+
+.. warning:: Not all devices supporting the firmware interface will neces=
sarily support those
+             drivers, please be careful.
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
+The ``uniwill-wmi`` driver always needs to be loaded manually. However th=
e ``uniwill-laptop``
+driver will automatically load it as a dependency.
+
+Hotkeys
+-------
+
+Usually the FN keys work without a special driver. However as soon as the=
 ``uniwill-laptop`` driver
+is loaded, the FN keys need to be handled manually. This is done by the `=
`uniwill-wmi`` driver.
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
index d1901990a7a3..8ca029e6f450 100644
=2D-- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25504,6 +25504,7 @@ M:	Armin Wolf <W_Armin@gmx.de>
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	Documentation/ABI/testing/sysfs-driver-uniwill-laptop
+F:	Documentation/admin-guide/laptops/uniwill-laptop.rst
 F:	Documentation/wmi/devices/uniwill-laptop.rst
 F:	drivers/platform/x86/uniwill/uniwill-laptop.c
=20
=2D-=20
2.39.5


