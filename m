Return-Path: <linux-leds+bounces-5645-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 725C3BB9BD4
	for <lists+linux-leds@lfdr.de>; Sun, 05 Oct 2025 21:21:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 411FA1891D28
	for <lists+linux-leds@lfdr.de>; Sun,  5 Oct 2025 19:21:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43B811D6DA9;
	Sun,  5 Oct 2025 19:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="sCpGjCGk"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E1E7126C05;
	Sun,  5 Oct 2025 19:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759692075; cv=none; b=h9GXDQ5uuqG1BmKZ3KVmsCcQ14QL6KvlXNdDCZWW0izk2jJMuQV6L2+Nx48fXD0Y5AePC8tzeXjly4LgpHIvVaw6UkKt8SUrZXeNSMn9ODBeCrjqTOcmTkQGaz7uCTRYK/ou4JSFuNHHjjVNjXNcmn/pAjZ7322rAkkNKwYUdm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759692075; c=relaxed/simple;
	bh=8Y8y2vF7P5uLfzodkY5F8Ubm+mtBEmU/RjuUqr5N05k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ngPNaUZXLPzf3cJ0zar8IkxMTf8l+3xMwqF4k0sjKP8o3SSDYfSADlZpjn7t/ClAapVlUdsoyPnsXQnYbidqcbFVHE1dTYRl5mphMh588U+buWhG3SCe3Nc7FntL8gfcntEoWeyZ2fxxvVcqvPdVbZb5XYoZBxG59RnhE3LcGVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=sCpGjCGk; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1759692060; x=1760296860; i=w_armin@gmx.de;
	bh=G+OqF5E1m0+dMYMeVINJ5VvpUCthe8B5HOgC4S/y+r4=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=sCpGjCGkSRtdZrBLv2vGn6DXhBtZLB71f8sFo2ctwbt2eWJ7um2vEnh3bSl6v7OU
	 TiBuxgH+xMeRgvN/CedRrFJmQfXXHC6Hy8CBKjJrbprYblxMNOmUVIGDjsGU98Qhj
	 jByuqn3JdCaEYwN8XiRbsx0A2fAvwwJGNpW8Fey9k9vXEuazgHnvah9eoQ60d81xb
	 dx5HkP9lwezpzwAL/eKWE00jgUep4k9ivaxznWPmWQdNnBw30aX96CGt/dLhRAHal
	 5AR0BoNwCVxVB4tCi4gLfvsUuxbXzo0E/+NZpqUB3bL662QxHwFDNsYmdPkI0sT9G
	 wxUzyu3UK7h6wV0zQA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([93.202.247.91]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MBUqL-1uzkjT2N7n-00HICe; Sun, 05 Oct 2025 21:21:00 +0200
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
Subject: [PATCH v5 0/2] Add support for Uniwill laptop features
Date: Sun,  5 Oct 2025 21:20:47 +0200
Message-Id: <20251005192049.18515-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:pOExStQFByFtG7FsPr4Y6f+6BVgsS1pFaHgGNu5pzIWU3bTD9ou
 ayAdnseIDopPhCWXNNRztrF0m1aYHV42tzg4JPV+5K5fLlotV5n9bc250Y7j/Y7URpmivIQ
 agBWuzaeyuGeDyw8Tuh7xaMZqI0dixV5UkKdZ+U0q0tqJHWxG3bjqfl3kaDHntj3KOlC63n
 I1fxWCcwhmBV5WYWMaNCg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ENnoxQeZpII=;cy4RlssU5CG+FVBThzMEoTj3EEy
 sEd1rI/GPC0Tafj1L5Je/yGbbTCkwaFhNQH2za7ZFdj5HIeNBtHkZkOMn3qUkJbyqaIbT4KwQ
 jOnSAZWoJIi4n+8SUjg2195TFbOVy6Zy0yKovxtmXSYfKQqn2P/HKZY8pGvT48frD5UNk+SCi
 DhhZu6x5sf/kJfLXSqtEuqUCfB0v/Q5mz6Ai6LKId8CIVO8WfAYaGzgFHr3Wh6Eml6E5fkfWG
 gThD3QHou42tjJ29Jr7z/Zp7OfgKRr2UI8U5Xe1YnH6Aym9sDtOPVVYg8ViVc4+4oSjvzqh0K
 lB0/XYwqw0V7cP0ZlB87gx92EZHwTeHeLzFDZ7Hld0mImk3Yi/xmQOZiS0RvID425nKMLkrc9
 CWuAy7lmoUaJxP223blRt2Y8Y7MrcozshVnz+pIWtFuEJIQb1BSDW+UqeE5p4CtXpFPrrk5h4
 5oUkwXCSXqNNz9EGnLJgLA7QXotu/7oDPjeqYHp043QRf9P3HPaqtoVO75h98FAs5900Zj9Oh
 33qt+RatfUFIJrfEC+txsc2Kz2IEFppfVpRfNTdJyFLuD3CrYyf2GBfx4mjhqSFLoj5sy+WP0
 aljOaWLnbesfPLJ1dMuk24fZKFxtqG7afynHuwYVIYIY2rP8jVV+EHaocRxrVWBZs1BfsXH3F
 Bft95LooSAoWNlYgMj1SwSpG6j2ccmJFRDFJWgAURheDO57M+9QYTrj2gEdQOQfO9rBbwyk5A
 IWxJxctRVawsuhEJ7w8MR/puqA4oihZqos7Oz45/9Os+fq+VIyckG8yzRRyDwL4AfIVAAVTGF
 PeyTN+UHLQ9ASMjF1+yZtrKqlGNZ/2+yrFdE9XfpE/0BzVPW0k9qVerxT6CQQ9tp9CBq2CU8F
 iB/LUHjrM+sMUJLL+SL9JH9ASDZS6A3mlyWM/ozic6Wq9NUXuGU8q3M4pksjth2YgpAKCzj4Y
 jtjseNB3lKq/2b8tlvglW0Hkix1nTUoA3mDrgPoo+HWGosJjLkSHVZaIzR9phE7sDRJfO7IuS
 06KIeUDPMEa7LIirrubzi5htJ818dRieEFJ8klq4w7g83BOXvBar4D94r7FZr+OH4GbyEKOGO
 +vk6vpSvHJkpErJi+bdpOL7FX1OfnprLvYv/Ouz7enI2F02mcg37AGThs/5l511J4aWmmlPc6
 t0xCdLV6RjK/Dkd++aWxZpR5vKQnvuMRXkHgSl4tNIFZKGn75giVVY/xeeZF/ytJVVstsxq71
 O2pKuRkZSPyNf4jVGk4UwB3Q8tPxVpXJswzb6ChKxP/g66bNTQVSGh8xhFSyd3FO0FQGqy74k
 wPDXIxFE96sWOJdEHqmjftk3VyBdqsjKoBxTcl+5OI45DNuK+uGotKRE778o3soJdQpA6qmIE
 PvEzceAtJ10KWMb/xIewJeTTxmmfr9HkkqzDJhsHKECOBsXcYnhVzlQ/pvIqjwGKlH7h56J5I
 sdPDGhepk0vvRez8dwBjY3D9JbZudhG93y12Q9D8whFc8x3rQS5u9q8yYSpgawFq6FzCpcAjG
 wbuiWvmd0/tPo4ekahpuyr6rhmK0dJPOeqC61VQtn8VtQ/LENSVxFbumDgVDBRKSbbfNP33GF
 RTLC0xWiy4QSd6EOjUnTLEG9m8NK2vfsmFxELlwVBWS4QRbJMhPBbJOBtz6Lcz1rw6d2LScDY
 3+HIAn5We9/AM7ISM2j0VNgX/e+r5w/vNb6S0zntcRS1/YC3GSi/FiIxTEJjRQDkA8vMAfUSC
 hqw2bGcQrNxz9dcXc0cOuLIHNpy11Lsg9kjV855jZoP4qdkoTarTa7yWiyAKx1qwuQk2WXpC6
 ZkeXTfRl2SoEq/V1DbfYdB/mmKeO4xgrRvN7gBkjmtRg9VsE9Qapb8cfvZvhQS8Y4GsQzrm9z
 kCJlktwGDr1bin7m7UviIPtrrZMu4OyGYrwp1RAZBEOeZwhfTIFqyyQllm7g1cNcHEZ+BUoMf
 xlsb3FGtV/c7l4bANqKvxZ0UmAthjFv6QtJ6uN3cWh/Z+L6Q8vgj7u+bUbQAQ0ruHf3cPHq/w
 oksh2ODbSOlHcOkyLZ73zBiCOkl1xp9+OiklbZ3NoncV0gQ/1qNSYkHgNfxnc2GafJXZqDCzk
 2K1cLQ9k6P0m2KHqLWrIJkauzZHmV+8Cq480LaiUFhuWCTfU0CGaK4uqXDVgp+EIZIW+ztXwI
 z7XNiCCkoAWi+iO0u7P8jeK8GRCAPO7KpehSKYvpCgZoWK/Gq6xPc/Tt9W/XnnPY+oMgvB2h3
 Hdv+zwM6JwTmwllIUXerg+CYU2BoqRHQP6eMwmHE0i1K2polz00+qZTZZ8DYShroOcUf3/1dQ
 luJ1Hi9MlsLD+s06UHJXuvgbzzeAjS50ycpDhxqCUcaBKDJoU3A+3XG4yz/uXVueDbE5MPB0g
 C1p29yL2+i1YzqYfc6vtIJwqpEylbBEUT+xW4lQUFIh6St2wu/pvfbBm5JLP2GeFwWbubCI6y
 u9532SclnbwZTHmmAtnfCBDbNU5kGKRMwrAe3ra4AA9AYeMrD40Biysa1fR0eHc3RA4WB7Fy9
 NqNKBBzww0JNujXgzhpXV5/t89hrDfWukR6cP3azL4Oy/Qe4+/mWNBzJglDImsUntl4+a9wJu
 O4tM6swwunsbQeuMuW/krxVUjAw5ZHh5D3aTCWBDJhJCdJlqVaSGL7LBraqJwDJtkE1RzSsGF
 22TNdeXOsZ4gACori1eGxEZiHNwCu8SV7yuVUxpMsSw7FJGdxyL9EAKkCMqYnmMpmIYYSZwea
 IlEo3HcOH95tqUS7a5RMCxHplMvnPDwZTz3Rg0vymGTOkkEYtkQnhgx4lEHTBqliSzHo4fSTS
 v9fZVbefAEXDSBNXyYNXA26oYaBIuMcHeQGDOUclUU6Ha1LaoPAoEFMwGA+ocfbT0cEzgZN7V
 tuSjoGs3FpML1VfolLim2GukesFy1N6cqtyXwKTDkdBYMyqemZi2pNPo03VOTp8s5fyAa7fHQ
 9X8baNL5rQqmcButBTB60bIWrJzjQJfekI3wjOoIvk4r474SR0JMbGzmRpP7ibgOX8723MQu2
 qcZ/O0cJjZfVc9CBirxD9EgWnky9V9WWxMBjHQoZa1j2RK520q11JNLO0S8FtrXWoxawhDecE
 0d1fvMPHUosZlzNrspsA4w+ZFuCxgSAmaU+5DmjM8f16jqZkWDqWW4tFcPd7VQfnH7OWzC4kx
 UyN482y10xndOq3TLV8wFIAxiQCvTRLnlAL8OFzJcXNnyk4QRc/2SPAQT7SMDu2yIqELt2AxN
 BNNxlloMCm6c6XHOogUjSRZdHn2Mpr48bl2FIv9G8RQ4MJpZ7KTu2fODQVL/vR87nqeIwYKya
 sn3CkTghUZZaAUAIq+2LrbU5y+x1f5ArjntjiIKp3Zqzu+l7jaRkURZgxOOrRo5cK4FXc9dBn
 Ljge+ztYl8neKe25HdaYnDt/0ez+qKOkDpx7OVw1EDxx8OrjWoaOihtMpgdKuWy/f3JVFKfEr
 rKZcx1/P/1w5ksELucAFsuHsgDv/rkPIeRObqWhwPB7dRqL5SelgiQWEecqnhF2nYN/wfVjFo
 kfuhiaRuO9faWteBaGOKS70Qr1hk9MhnYVe766/u0B2lcl+kDbWtUiYoQo9n3+u9heUPJ0Gud
 j/uZ/UVPF8YuhCGDXMxK7vPqiGGCWnI7ThC4yhmy2xrdI0Jd3TuYUsBVvMHYwYTLKyIFe1f6+
 buCTjKiH2J68L9pcJL6MfZBLxFYLkt4fsS4bWXfwbc+U1ujfsSOeYgavjEAp06B9bnPFm78bf
 qv/tP38wYnI8PPEt9F/FdYzsgtIB1JVttDVSUox9Na3xeVQO8t8DZZ1Cm8uRWpUy5eXQpD1Ci
 OD+mQMKWia0Iiv+N+poRbFIZE1P4SNsa3YbZyWttqOu1SG3jtGjOcuMjeIo20gywTa5Hu3Ed1
 7E/4rkcY4abtJHVrjyXkXk/XEyFWD2hsmd8D97ykRFHg8NwHyQUYfbX2XwP+j0NLagkRhAk3k
 5GsptdEdZ+ogm5K6CsAnDdh5QcYoffvGta1+0dtdAauc/ZP2X3/dL38ZSbN99Psig2cQCcj5w
 UzA6Og1I1z3QGGiq+uDpRg9g+cPA9liwWnwUcWP3x6fEuGzEYa/7u+Osl61lDkAJxjC4lbX19
 vsUdiycxLkDwYSpf9YuSKiHlG3N9CEHfSAd3eAvs5kfkNZ0SK6pFOf2gAF8ZiVbksTLPoEgTQ
 z8mwhcEfIFT0H7v3JARbKkqjJ/kN0ECTK0s4dtvXgN1Pbokmq8UEeA0iRh08Or7/0NBXdU5eg
 XPGJCyfD7TRjwUtN4w61YXl0dIwMXsMM4FIQ2ZpouywpGAEnCylOW+eHjKxe/G+me8/IyHA+/
 9/MyXH6SidrhhdyibtuyOCL9V7P2v+IMsOWcmE1Z4gHi/xu/hGln3l7lkBGFtqbsZ3IQOakMr
 aSJ8WK4cvbQiqlC9oxeecRi4Qdj75njrQVz9OIiYoGCc7eLjI7l+WvwAfJxiTBzXDk230IPL7
 yNgK3bonREwZ7PcaOnSXZ+cnp8y1m4feJKRaaIneMoO4R7tMrsJN4lKbW+aFkUmA6XCjRVW6p
 uiMcxJRE6OJad/5CFT8K2MLk6Is/hKQWCustTXasN2PoEcrU+zjRXmaUNQSYduds/e6LfcW6n
 QKXYjKWEKABHsehoTRobq+LY16HpE+rTyCZAOA+KctHBtFL6iQbWGmdaWAKhJp2Rs9QuEf/qm
 9XOVMr6anYT7D1XMkxYRoKrBN32RBsmVQ0ZpmxVJzuVJo9HwrB5OMfQflqrSTSUTFjybSahvB
 iMFXIV3B5CaI33JHhO9QfgvvZStbbTD2DxRhYTrAprUX19BIilWk8yz5ItZvEcLE764Jk/rE+
 O8a7mVIewzmKfmrXiucsfI5gJHb7i3Ee1BzCHM2ejGi0r79PVnCAgg6BRvoYVfeOP+5seHJgX
 wxh3cPbqNGl4bcJpCofIp7/cGTFvFgZ2d2Vdpxi20zpLk7UiHSaYYuTOJ5p8y6JrJYu5zXoJH
 q+hZAJ2I3mGJ5+OKtL2NPAvhieOVbk/lqq8=

This patch series adds support for the various features found on
laptops manufactured by Uniwill. Those features are:

 - battery charge limiting
 - RGB lightbar control
 - hwmon support
 - improved hotkey support
 - keyboard-related settings

This patch series is based on the following out-of-tree drivers:

 - https://github.com/pobrn/qc71_laptop
 - https://gitlab.com/tuxedocomputers/development/packages/tuxedo-drivers

Additionally the OEM software of the Intel Nuc x15 was
reverse-engineered to have a better understanding about the underlying
hardware interface.

The first patch introduces the uniwill-laptop driver that consists of
two parts: a WMI part responsible for receiving platform events and
a ACPI part that does the majority of the work by talking to the
underlying embedded controller using the INOU0000 ACPI device.
The whole driver uses a DMI whitelist for identifying supported
notebook models as both the ACPI device ID and the WMI device GUID
are shared with a wide range of notebook models that might use a
different embedded controller register layout.

The second patch additionally adds some documentation for configuring
and using said driver.

Special thanks go to:

 - github user cyear for bring up this topic on the lm-sensors issue
   tracker and being the tester for various prototype versions
 - github user dumingqiao for testing the battery, lightbar and
   keyboard-related features
 - Tuxedo computers for giving advice on how to design the userspace
   interface

NOTE: During testing it turned out that the touchpad_toggle sysfs
attribute does not work. The reason for this is unknown, as the driver
emulates the behaviour of the OEM application just fine. I suspect
that this feature only controls some obscure key combination we dont
know about, so i decided to send out this series regardless.

Changes since v4:
- add Tested-by tag
- fix usage of guard() inside switch statement

Changes since v3:
- Add support for UNIWILL_OSD_SUPER_KEY_LOCK_CHANGED event
- rename sysfs files to prepare for future changes
- use kstrtobool() for handling sysfs input
- add proper led locking

Changed since v2:
- Use the INOU0000 ACPI device for talking to the EC as it is much
  faster than the WMI interface used before. Additionally the OEM
  application also uses this ACPI inteface through a special driver.
- Merge the uniwill-wmi driver into the uniwill-laptop driver as
  the WMI driver should only load when matching the DMI whitelist.
- Various small fixes

Changes since v1:
- spelling fixes
- add missing error handling when reading PWM duty cycle
- fix error when setting the super key lock sysfs attribute

Changes since the RFC series:
- spelling fixes
- mention the INOU0000 ACPI device inside thew documentation
- use MILLIDEGREE_PER_DEGREE instead of 1000
- use power_supply_get_property_direct() to prevent deadlock
- add support for KEY_KBDILLUMDOWN and KEY_KBDILLUMUP

Armin Wolf (2):
  platform/x86: Add Uniwill laptop driver
  Documentation: laptops: Add documentation for uniwill laptops

 .../ABI/testing/sysfs-driver-uniwill-laptop   |   53 +
 Documentation/admin-guide/laptops/index.rst   |    1 +
 .../admin-guide/laptops/uniwill-laptop.rst    |   60 +
 Documentation/wmi/devices/uniwill-laptop.rst  |  198 +++
 MAINTAINERS                                   |   11 +
 drivers/platform/x86/Kconfig                  |    2 +
 drivers/platform/x86/Makefile                 |    3 +
 drivers/platform/x86/uniwill/Kconfig          |   38 +
 drivers/platform/x86/uniwill/Makefile         |    8 +
 drivers/platform/x86/uniwill/uniwill-acpi.c   | 1549 +++++++++++++++++
 drivers/platform/x86/uniwill/uniwill-wmi.c    |   92 +
 drivers/platform/x86/uniwill/uniwill-wmi.h    |  127 ++
 12 files changed, 2142 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-uniwill-laptop
 create mode 100644 Documentation/admin-guide/laptops/uniwill-laptop.rst
 create mode 100644 Documentation/wmi/devices/uniwill-laptop.rst
 create mode 100644 drivers/platform/x86/uniwill/Kconfig
 create mode 100644 drivers/platform/x86/uniwill/Makefile
 create mode 100644 drivers/platform/x86/uniwill/uniwill-acpi.c
 create mode 100644 drivers/platform/x86/uniwill/uniwill-wmi.c
 create mode 100644 drivers/platform/x86/uniwill/uniwill-wmi.h

=2D-=20
2.39.5


