Return-Path: <linux-leds+bounces-5646-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A03BB9BE3
	for <lists+linux-leds@lfdr.de>; Sun, 05 Oct 2025 21:21:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F6F91893C2F
	for <lists+linux-leds@lfdr.de>; Sun,  5 Oct 2025 19:21:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C41E81DE885;
	Sun,  5 Oct 2025 19:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="WodEWYOE"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A105126C05;
	Sun,  5 Oct 2025 19:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759692087; cv=none; b=sYcqruaFRwPmGSrebJEahzZstUCzHeX/xsGtrjvHIR6oru+piQGZs/+9xuyi8qWWGi9O/bLEi3iEiJGjl7RCtnglBl2Ccc6AFL4WfyVDnenNv9NXAK7xJOLcqLQVU7KmUcKt5nwZTNNmiXQ5sg1tVUMDclfZYNJ5fQqtVOUWCKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759692087; c=relaxed/simple;
	bh=Q1gQBN2WR+4JZVnS9HV4J4AwuV4qtT4uq2fMO/um91Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sTg9xz9cvMVTjct1ikFCnBE6gfS5JjV1AZrNThkZI2Rk/tGDMnpni6aFX43sHtmNNVXoCrTtniUEe1pDpR5/GzBY8odMpT90PcZ30clMijtKql+RUoe3IfPQiFLyGC5rGChqGshU4nsGVFaf3Z4pocvla4PlweFtWyAjU50hJdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=WodEWYOE; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1759692067; x=1760296867; i=w_armin@gmx.de;
	bh=krIZviIgOgSFTijcgMiy2F/7ZMwatmjF1BWKPMUZI4I=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=WodEWYOECAqxzQR9kgyqpgUkNLvM3QANUnwEovgca8lhcLkwpMpq+tgYjsMj4PZt
	 VadB2Hucw3x0JM/YYQjm7huSKQPHczBqM5HOWp85QQ9ISEFJ1V9GIS2nIxv/Z/GIm
	 f0qE2Jk4gq10FZCMMmgRYstweDR2Q5DX0ZcycajRDE8KTUw1lolJCtCTHeo/mC7e3
	 PBwp3cNSiNRnWgReWaZqIqnaSGGxCPN3kdcE66/R3cbL8VkjzQZYon4TeNM64/70i
	 niUGq9FUDpL27twZMXNcwi9vhjJwoJUEGH0QLWQoiwKnPFfB9ENMuBXr9bkHjU/4X
	 NszEtFbgkz4n5JWw/g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([93.202.247.91]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MsHs0-1uG97p1MUs-00yGym; Sun, 05 Oct 2025 21:21:07 +0200
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
	pobrn@protonmail.com,
	nathan@kernel.org
Subject: [PATCH v5 2/2] Documentation: laptops: Add documentation for uniwill laptops
Date: Sun,  5 Oct 2025 21:20:49 +0200
Message-Id: <20251005192049.18515-3-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251005192049.18515-1-W_Armin@gmx.de>
References: <20251005192049.18515-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ofAXTkmnOAI8dHfryBhawiXOQ6M0MGKzyL3TksoctljU3r88Q6E
 w4mhD4N0wQ4jHA9O+TqZ87p/0Uc13Ygf4i9IkFgJ+ELp3UzndfF4qpOdr4+fMmW+gAbA8Ju
 YyCunFdaNQlwFkz8768Db5TV7Ho1kC7ufPYE9Nv5ixBFMYA6pjKNNzIrOtXpFZTslgbN5ru
 ySvhjXVkYIfYXcb9uWvkQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:mZHPRPKzHU0=;z4k7ZYeyKexupXN6TAU0OYuHn+J
 a/kgpsorbDsIhzSsfsRPkF1TfqWoD0BTAWBexvxXWQGom2d10v3TXwfEn4TbahDwsxxuvF+Na
 XNa6nZH5cJElQUz9CcOoeT71olFYXD5BigmbLrytSHADkLocSc3HxpINo33Cw4vRr4qJnsDbB
 UG21Rd8FHaNZ1jsGKaH33jgtCxA/ocPKsl615JvdhQUNLTQLVJxe1X12cnnLfdZlZdE1OEhDI
 iuh/sYfqrmymyP64thbken1xzEIMG/jKAKOn8rBMBkTlyyRcgSiKRAZUQjiiMjgGw4aYmGl4V
 TNaSUamyI/CvNj4lV2dUviEOw1WFrVwuO3GnoVl0e2PrUGmTlQghMzv33SA5wW5AJ1SowF3hv
 sngkdEwnLx2Ekb06KDodQvWRodCFaGZcOovyx/J4UYi1P53wdbToBWnE2AOk41Z9+bLXl+E16
 tUJWgbwPPB9BXt9Ccs+3/UWNN9m/ry9nLCj3X1SK+jq2st9eNfCHvVGIGPFGecFv19j+JKvIH
 T9bCbwFJhXbrNmiGHP0KhZjXcx4HjEUpk/e51rI/fCEu+xucONdt8l3DnxN05NjLcWMVVffk7
 pnlrdTNjyBGH2qG56c6U1edcC1OWZlLlVwu/ZWZeuAYFA5lMqOM/EQ8TQDBJIAArUvXYDiAsp
 gFTSzQxI0QoEFyz1ZzmWsOHhhqkwQlerBitfb60k0dLRi1DXRAeGTjkPL2MkFvh4SEY15/+Z4
 cwP0rvNDueo6yHrHJEFYDWXWp4oxD2NoppjCUftOTS+h33mAhm/ypqLDbMr8QPwi7ai5Dbs5x
 FCSZdRq0yTTr1hHFTjVYqEBu4rAUAwWCpktfln/FPRnwFR1G9oE4S31SYTSH/BlKooTjoSkWA
 IhFK1z8J9FG/inxhGqKv/PiIjYDzX37XJ54nAYpU+Z5x3RoaNF/kh07ZCLXaewmQfw/+rxGKC
 yjoAGNixXcYS5HshwDPonbDo5363RwK+3KZOpz4OLNzmooteBShoGx436EBEr+WvOJYKRb6C/
 rtbZSqLMlpwUZtzzPpVQ2KL1AFVXYwgBGkRM1HLX4K88YYonu7HEl69GePM7WBSEud1wjon+0
 Fg9JdWEyxLhDA7t8dfBwxn4a5SJjAFigdPfIahbxVjqPFrhcQKAWFPXHS7gNlO2PuI1RTDj86
 hL7u8zmfXGojsOofsMMeAMSkDKUpyVE4AopGbpdHPbmWOHxEkthJQrldWcyiMlRHO/T5+1mbN
 Zt2WIqh9tDupURm9xi/+1Gfr0sn5XTAw2uaIaetR1Ox5hyqXcCYJBl1rS7ITgFjUPv7Z7t6Sg
 ZAEH5cJQ5I7o9KjgP/i4ah7ZatO+ilC2BM1Lau2uJWYxhSjwH+9qqFJiEx5thPRt6nAHA9rHX
 /XZc6rMglOIdVQ5GKkPvUOrMzv/7jq9WfJM/8R7PvoTUjlehtdXHdTaYtQ5ode0Dsev0xmQC9
 XrzmWVoU/Yn9FmLORzCpmjlhXtJ3E3KjMSXksmUZedtRIQYOGPJOMVtGXECwWpInScyz7XD92
 iqHNbVDnVdLsS6bL82ntEtPooYo9DTIB6dxdAZpC2IhKMjDwqVLG8ao5KsRxA86efOfSfNigx
 IOTKeOCWe0DHCwqMQkKPPCFAwqN9JUDYI9v1LoZn/q0grIMaO7fBlZew02GA02THsfNJpcCeq
 xbyAA/SygJtZOeVK+dejLt/5ovNOBdfl0qpY1n7ioSj1T+DkLp+GDLOUxELJcugAzldod0LDB
 KK/bJHzJiJg9PeqNxUvic/FwqQFDazDZ/szNSNeSS5yE7TZBvmM/AzLNLr9e5Mv7iflEOmy1U
 NHxRfbu2eChXt9HaNTOuPlYUDvga3jo+pneevX7RG7VcHhwsR9oPhPzBHcQXqIpQsYb8eCZX0
 /1d9jL2Tzs2+QTLvRUf+OVPJDjyV9bsKGbX6P5XFl7ie5yQv5P1kCwvOv6KGL+G7D6TI/Ss2A
 XAyjEFRY8eoj03tPa6szvlf/NxI88F9x80JiTCx89dnkZM98nQQORjKeJGspabnbgxMGThqXZ
 66b4ED9zHhoxosmISvWNXN1yMi1T0zgQyXnPJDPdI8ftxE+YPbeautCAatNazwCEhkh6SoqJt
 cpZvj2A/P9QMllXBCX4KeYWFXJG4AwekISOB1K6xdYlgbTBDghm1Jc1S97+j8FBfjw96aT0oA
 70UIqAvoJ2131jPsuq8GQ4JWB5SB51kcW+WfTUm3PRdXVtEQU0sJqUm/XDpeNAC+cQd4klh+/
 pC+Hq9iGLIYKENcJxZhDaxFC5TBwc9PHba0D8STnxPJxMxwxT3e4Lv/pf1WklnbXLDrIyK7n3
 8KYkDnFPsGeLTrcJBeyYEzh+G0T0Uf7IHYEuKo9hsnyArM/UPeqlU564T/FzNn42lh6tTy9Ea
 FMGgTAR5YqYjnd282qOFVGIx05rxSKyGxHn41+KkY5Aoh8iQKof7Qev3wylx59I5cQBqbNDJr
 GWJIJRbxrIGSaITMAJd/UCzVefLxQm6gj6L2J8zs3Wd0391PFB5LNyEkpRgyp551HCMvE31TK
 AHoSfNBwaKJ8axhziVyaYgHtGl3BTnOiq40mYugSs1dTS3ldZUqgQ5x5tInZVkgIfy2jwVBxa
 ZjLIwrhvjt8ssvVY6tkzKyuxUz9hgxmJb+cPcz8K96Ai5nPLQsGoG2/lfsjEKAQYRkxXjDPHy
 /3GL/vHSiFBExPdyDrvkCPVamv2x5GINnt7rUVZWU1wZXNGknnNn0y8cBFY0TpnXMVJmCvZka
 E8N4Ow+N8fgW7UQ8/pStB1oKlqzQO3HEzYGZ3kwOgXlPWR79M4I3MXh0aaCB8EY/D9ny9sRgM
 SYME1IJlV2pzn6ssAxuMD+Kv/63iJ/YpkHtgDI8Yt+vsMpbGOhpaOcewyra94KIY7wpwOiAyi
 I+8RwSRwKKdPoB/TYMhPZbUHzYTcaha7JfC7VgRm1USGWrjCR0KUqWrBBABd5Qz8ov9ONFj+N
 sWkL7h7XyuSGDpeYa1fMhw7JhKehSjyG795No7ohw8Lis/6f2+Jn+cRywzB3x19Ads8znnX2V
 j+Nryv2o4GNIz/Nvb3S3NJ0GeH+sje3SY6ER4JDWzecF3oFRavKsHmcqu/ZKIKDODRzuIF9QG
 aLnPWWTRuzMgwTaYMjdZviCMyXLHmpoLPj85In0XHOtXXPfbdi/p9WMSgD+mBFuiHP3sVlHZl
 QkPHK3QZHdaoUlIwpJoGFKawC4ZqJIULMigIGxD45nu9SdVZAN6Rt3qEnJn8puFKrwZHol/eF
 Fo50OI52RBABjPHatww9xSeaEmycEjdgNJrE30XXVAnKWEqntrAcTtIuybXBZMYtg/sZzaJ6P
 hyc036C6HgulcCpb7XIpStblRyK6UxMCrFqO6xtFI+S4SJwPFOy9dkUIQhgi2XawtxrMgLezz
 aQE1tHWKkfwf9BkXimgX5peAdbBY+bU3RlrdNPfpsSZP9iVb6U8n7yr03eDoy2KbCR65OsxXq
 aHFao6jSQdujsQOggXNdfulk3KVKGCab63H806pitgFpqcc/7g+o2P+FsyD/80gwgFRYiF5QO
 9RHz2nGg3JkHPScUm5nZRI+/0qisZUfeHC9hSCfv/Prc+DufM/A+X2lTY2d7Ff93pVw4yDGIp
 ou9PSGhKmKHRBVXy3Ak+Hy1RQbR5ktM5nOaZoQM20GPg51SgGRTljzg+8ym7/E/e+yn37ASJH
 /iZMMa2uoqmmeZNNJDw9tRgnvtq5cKWdcfV+193/cGDtS08bbrWcAISP4DXdmhoCmojImXHNc
 vj4p5on65UV/mkSMigo/ERzKXAWxUEk/DDzspVgjhDW7OwDSisehXLZ58UG6imYzaAr0upYAK
 ciH1O8M40cRUxcEz5vBXh5sFvTTemVLaW00PheZpUm7Z92Aem3A5HwlzoX9jOQj2r/9XvbCzL
 +agSHjRMyxSloFnHhmtXDqGuF1RrtEr8Rbgam5V55wwLYhKpS0/lyXeeJlnP/UcjG00SfdfwM
 4EqgcQkUV2TfPR7UtBAIe2FUIxE/Yu0yazTWA74ah/U8msqSflkIo8b+4CnC49rIiV5Io9oOS
 mdRjgxuKT+D9NTgJR0Z35ls73hKxdHjUwgUR9gUi8yjPt0R6xHfrFgPPtgmhj4hnNO388+KPI
 W6Ey8gr3zHqXFpkM4jOl6dauexGo0F8Lvi/u47ZMvOF+PIGu8SDVLk/Y2q5ARO3BuwTinj93P
 omBdeQ3PEx5QqCvRWfRA8HCjfdq2G/bUjw1MyUVbpljKMc9rX7uoMltUVHmJwi5s5BuBPjKo1
 4eBoPSNtItirYOv1VGOXuottnt9gbHBehC9SMtwQtEYOw45JUVKptY//Md5TQe4CJNgNHNxk8
 66dgvtcmyeHPJ2V1I+055xGvAdXChkLYSScoQJlEUcyWBRE/oY0jq3NRCbykIDz+aBquHmBnF
 jjDahLnskc2TFUd8N+az26utDRlhpiuf/Q1YSH1dHm159wS+AtSZ/FAAnrUtssSwcAtXRKiAG
 JXsxt9VK0Mwt10pL4fG2Ly+DmP7nCQrtmhfvE7OGSzIZCPjUfW8F1bfSzNt6dd6ZXuZ9std3V
 HKgp+cB43RDtRFYzxVU7cKwBtgdCy55pfsZ1/8riSAcv7Gb9lyDbFzI1tD6k8vPXDJHkffsRy
 YWc6Pfh3zUC7TDU81amFkX75azKyM2OHYFDr0Vu/rikt0X+Yd0mqHZN5ElwTkHlehPszeMs+C
 tpYNY3LM+FjLYGBZqo1Ckw16QxYb3TH9FdWYp6kLYjlOO9LbU6KF6kdN40CcAQ/ElrWo+NpIt
 t3suRzkIi6SZ50kkxFrkqonrTwBuGppnQUQskMiw5noBWpA7dRv+gYY3DX8y+XEsHSdS7FqAb
 lb+/zRqd7iTQZuGl+gwxDn1Xr6T0QJaqXKnetUEQt/d0qy0o1js4ozUgquX0qaIsKBPXMvBVx
 ZfpZ2uIdEy0uFtEAWUipz09AN/GzQ3PVqwkItltwJo9LiPjgPW5FS1r9Dr3wf/J3boicE3o9o
 +cAtK8Gudvf3VF1syUP2AxtT7XlmXlCHJiMt0kP7pYaUK7+oCe0C0TnEgEW+i8yD+nWTt947m
 RIZ1n8ttiLpuOzChhMZ5KCf2gA=

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
index 7b58e8d9af3c..5af58afb1a11 100644
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


