Return-Path: <linux-leds+bounces-5358-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 53764B3FD11
	for <lists+linux-leds@lfdr.de>; Tue,  2 Sep 2025 12:53:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A684177105
	for <lists+linux-leds@lfdr.de>; Tue,  2 Sep 2025 10:53:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B961C2F5480;
	Tue,  2 Sep 2025 10:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b="nJ0D0uAx";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="nJuHo2jM"
X-Original-To: linux-leds@vger.kernel.org
Received: from a7-12.smtp-out.eu-west-1.amazonses.com (a7-12.smtp-out.eu-west-1.amazonses.com [54.240.7.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA712F532E;
	Tue,  2 Sep 2025 10:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.240.7.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756810433; cv=none; b=ATVVdEaozf8EtD5JY6vN/RSCjIeOdOndWUHiIh+ikSkM02B5XegEPCX3OoJ+7kOoYz/MJUY8hsx/pqIb7K4+eFPgGvbdcGNVcY2tflmpcM0DyizZrwl9QSSloArGHEyWlMmK+I/u0hi2vdBcPFJd5UClB6hiQpbUrtCUUV1Cjp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756810433; c=relaxed/simple;
	bh=1qckQvzwlWC/fKlkJTiN3ZnCnQ5EdaufHJeY89/pEVg=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:Cc; b=AGBEnoOcq75D/4yJ1+YLNVVJ9dq6N1AW9B4wMDEsTbWGX05Tiot1YzI0ODzfiCNsUaEXV12rGZhxDZMCEQb42b8tEtwnOcZNsmSTddxMKvnjtxPqnP2QGkeEEgczJj4wY8xUy9TePwvrBlV09osvBfDMJ1YZh27r2vo1pVkZ/Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vinarskis.com; spf=pass smtp.mailfrom=eu-west-1.amazonses.com; dkim=pass (1024-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b=nJ0D0uAx; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=nJuHo2jM; arc=none smtp.client-ip=54.240.7.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eu-west-1.amazonses.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=vuvznkywrn6u4jb2ozie3fqz3nbg6pps; d=vinarskis.com; t=1756810429;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:Cc;
	bh=1qckQvzwlWC/fKlkJTiN3ZnCnQ5EdaufHJeY89/pEVg=;
	b=nJ0D0uAxUw1MnHCpQjaEVZn/HHn+lc8nccE7MyOMHpOggc4rOsS3XxBkeNjeUo/y
	DoAajtkg4X55l/DZzVedb+uMtnnPpplbyuLbFL9WuKQIgx57skjpk0fnmHCoAaRqHN0
	+NRHusKu3wN1IgtIw3b0xHkTVpVM4VhRGof46gro=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=ihchhvubuqgjsxyuhssfvqohv7z3u4hn; d=amazonses.com; t=1756810429;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:Cc:Feedback-ID;
	bh=1qckQvzwlWC/fKlkJTiN3ZnCnQ5EdaufHJeY89/pEVg=;
	b=nJuHo2jM7pKvFYSjpHu07gcOnSUMWejM8PVNqh8VaYi4fXvz65QoqxUBthpy0p4M
	U4KpFCxqYvVN+AHyKlPNXlOS3RmjD8uC7+cJCyVUZ8i8lm3LebmqqCGzQjCYmbIk1NI
	/ZCc0qUQv7F/KL7RPz7KpotGzISoADznrrrdAAk4=
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Subject: [PATCH 0/2] leds: privacy-led support for devicetree
Date: Tue, 2 Sep 2025 10:53:49 +0000
Message-ID: <010201990a0fc52d-39c2afe8-587d-4331-8a4f-8edb7b45c124-000000@eu-west-1.amazonses.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKnMtmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
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
 b=owGbwMvMwCX2dl3hIv4AZgHG02pJDBnbzqzxT9XkXPr/pNb1PTO+x51jscyc/PWwr3d06dVgC
 xbV9/sFO0pZGMS4GGTFFFm6/3xN61o0dy3DdY1vMHNYmUCGMHBxCsBEzgcwMqxxWhI2Lzrqemij
 ge83Y7WKH8e33rteMC825aun7n4vTW5GhgvucU/smOO+hs8wb3e2FEqs+Mx63eOYzplzCy8bcoc
 6sQEA
X-Developer-Key: i=alex@vinarskis.com; a=openpgp;
 fpr=8E21FAE2D2967BB123303E8C684FD4BA28133815
Feedback-ID: ::1.eu-west-1.dmE2JeRFSagpgiG6D+fa+YE0PH7S+b7tab7/4kfDOU8=:AmazonSES
X-SES-Outgoing: 2025.09.02-54.240.7.12

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


