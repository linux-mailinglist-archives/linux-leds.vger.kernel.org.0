Return-Path: <linux-leds+bounces-5359-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E67B5B3FD65
	for <lists+linux-leds@lfdr.de>; Tue,  2 Sep 2025 13:10:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A3B54885EA
	for <lists+linux-leds@lfdr.de>; Tue,  2 Sep 2025 11:10:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67E4B2F5480;
	Tue,  2 Sep 2025 11:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b="iuWeJ7IM";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="XCStTNbG"
X-Original-To: linux-leds@vger.kernel.org
Received: from a7-18.smtp-out.eu-west-1.amazonses.com (a7-18.smtp-out.eu-west-1.amazonses.com [54.240.7.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1682765C5;
	Tue,  2 Sep 2025 11:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.240.7.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756811452; cv=none; b=SIxtDcDbFhnbdzylIz+eE7feClnuvI5wwEbDb/tdNoiaUgUs8vtizjO75L4QG/FlD76tOTuMc3oUydEaFlbLmM4Eq2mEAwic23BUphpMozcveUayBurUTxwtio3rFiEd+5/LsJvYEnf00MUoah25tKPaCrtcwPjNo2JiP8giQz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756811452; c=relaxed/simple;
	bh=1qckQvzwlWC/fKlkJTiN3ZnCnQ5EdaufHJeY89/pEVg=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:Cc; b=Oniyk7auEQHEAqxUFhfMDhlDrd1GmARP6T5TBZy/wXQ0+3TgwUfdbFRFlABeL0b74YCD4bpF2Wx0/Fb3hrGGR+R7teAcaOHW/xZfrr0PC9A1nIn29b4kRTQIHrgGnsqE+5AIq+mLgiTDtCDpTTgZIoxb923bZ9ieXVYGwvmZU+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vinarskis.com; spf=pass smtp.mailfrom=eu-west-1.amazonses.com; dkim=pass (1024-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b=iuWeJ7IM; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=XCStTNbG; arc=none smtp.client-ip=54.240.7.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eu-west-1.amazonses.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=vuvznkywrn6u4jb2ozie3fqz3nbg6pps; d=vinarskis.com; t=1756811448;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:Cc;
	bh=1qckQvzwlWC/fKlkJTiN3ZnCnQ5EdaufHJeY89/pEVg=;
	b=iuWeJ7IM/awOX6TDNMaryJmdvwXLy8orSrP7IU4HhbFfu6hTU+ljBy6TqwlX9VH0
	WYFb0ooIXs2hcsdh7zTcZnrMbEYUwp+me71Z0bxiwb25y6lXobfdVYK9iFRC6eFInHj
	qjsNqxJBKM8ayiQbm1dUuAG38Y3lWRSLuOO5FfCg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=ihchhvubuqgjsxyuhssfvqohv7z3u4hn; d=amazonses.com; t=1756811448;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:Cc:Feedback-ID;
	bh=1qckQvzwlWC/fKlkJTiN3ZnCnQ5EdaufHJeY89/pEVg=;
	b=XCStTNbG72BbnL66aW4tFnwWKuUcLHnEtADvC1jhwkNjNCGosrQfKeGrmmtbYXld
	gW0QTfGcDS5gFJUbuZWOivtP0sV1ivSOHNTG0utT8XJ1O3g/GzrbszsZ/rdQs0hxHPS
	vMttAk6EwGiCXYtMjfc1Iop8tjv4bXdFfQjH4nZ4=
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Subject: [PATCH 0/2] leds: privacy-led support for devicetree
Date: Tue, 2 Sep 2025 11:10:48 +0000
Message-ID: <010201990a1f5100-d47d26c3-6bbf-4119-8410-b5040e080dbf-000000@eu-west-1.amazonses.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK/QtmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDSwMj3ZzUlGLdZDPDZAtz88SUFAsDJaDSgqLUtMwKsDHRsbW1AHbbYLd
 WAAAA
X-Change-ID: 20250902-leds-c61c877add80
To: Hans de Goede <hansg@kernel.org>, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Aleksandrs Vinarskis <alex@vinarskis.com>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Linus Walleij <linus.walleij@linaro.org>, 
	Hans de Goede <hansg@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1243; i=alex@vinarskis.com;
 h=from:subject:message-id; bh=1qckQvzwlWC/fKlkJTiN3ZnCnQ5EdaufHJeY89/pEVg=;
 b=owGbwMvMwCX2dl3hIv4AZgHG02pJDBnbLmzeL7J1X3rO/LBaMYbgQ/u35WTu+PnTTWPfrdy4q
 xv3SDJt7ihlYRDjYpAVU2Tp/vM1rWvR3LUM1zW+wcxhZQIZwsDFKQATWXyA4TfrzqMF96YFcdhe
 Xp6je9msYaHF/86T6+axbVjBoPkiqzqX4X/5ivvrWD/43GnLjVzUadXY7Xd4/bHup+nNF8yde95
 cfsULAA==
X-Developer-Key: i=alex@vinarskis.com; a=openpgp;
 fpr=8E21FAE2D2967BB123303E8C684FD4BA28133815
Feedback-ID: ::1.eu-west-1.dmE2JeRFSagpgiG6D+fa+YE0PH7S+b7tab7/4kfDOU8=:AmazonSES
X-SES-Outgoing: 2025.09.02-54.240.7.18

Re-spin of RFC patch from ~2.5 years ago [1]. v4l2 controls for privacy
LEDs has landed, but the DT part was left out.

With recent inflow of arm64-power laptops (Snapdragon X1E/X1P) which
mostly use MIPI cameras, this feature becomes more desired. Original
rebased patch is still working as expected (with respective DT changes)
on Dell XPS 9345.

Changelog to original series:
- Pick RFC patch, pick R-by, drop RFC-related commit message part
- Add new DT binding to describe generic LED consumer properties
- Rebase and test on X1E laptop

[1] https://lore.kernel.org/all/20230120114524.408368-6-hdegoede@redhat.com/

Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
---
Aleksandrs Vinarskis (1):
      dt-bindings: leds: add generic LED consumer documentation

Hans de Goede (1):
      leds: led-class: Add devicetree support to led_get()

 .../devicetree/bindings/leds/leds-consumer.yaml    | 69 ++++++++++++++++++++++
 drivers/leds/led-class.c                           | 38 +++++++++---
 2 files changed, 98 insertions(+), 9 deletions(-)
---
base-commit: 3db46a82d467bd23d9ebc473d872a865785299d8
change-id: 20250902-leds-c61c877add80

Best regards,
-- 
Aleksandrs Vinarskis <alex@vinarskis.com>


