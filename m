Return-Path: <linux-leds+bounces-5426-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 728A4B48135
	for <lists+linux-leds@lfdr.de>; Mon,  8 Sep 2025 01:18:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD66D17D3EC
	for <lists+linux-leds@lfdr.de>; Sun,  7 Sep 2025 23:18:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4525223278D;
	Sun,  7 Sep 2025 23:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b="K8LcTonE"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-244107.protonmail.ch (mail-244107.protonmail.ch [109.224.244.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742D4139D1B;
	Sun,  7 Sep 2025 23:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757287107; cv=none; b=faBwerMswXLBWGKwtimDqR4SmXWYHl51+RrDyj6xQxIogobNrb4bBgA4ORGnaUxqJcg6TgBWLXqYbymC7cZZUKV+ESrKYS6GdAG18xmQDgYV8+U6v7mt9YTWAhDe7ih+PhefYsNISKUTQrPbODJm+8njwMYggZf90miW670rOxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757287107; c=relaxed/simple;
	bh=k8iX8f1s+IR8AvU1agIi/j65Y7bAoHiH3WV53x45EE4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tyOmXKqkRLTkSEQKrZ96em3iioJiBLy/gJIDRx0dXjv3zJzS2lq6ppWof4huGts793hx+Wc9LkYWmcuzDu4NNFovdnl3y7NUimIoknJvQBxOF0020CQzFcNSXP3VqHoM8+PXwC/HjcrZe0TTZ/TXkHfB1nSvpRlc2bbvlenj4jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com; spf=pass smtp.mailfrom=vinarskis.com; dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b=K8LcTonE; arc=none smtp.client-ip=109.224.244.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinarskis.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
	s=protonmail; t=1757287096; x=1757546296;
	bh=E8FRq9d04k6YYbAmL36bn60thwFzL/SsLK8ZOEggcFE=;
	h=From:Subject:Date:Message-Id:To:Cc:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=K8LcTonEyRrDL6rilzK5+auaZbIX+ZvrF/aZpkI22wFAWucu5YVFFTJpgfeF1sUE0
	 jvD5ipo7+6negfyQKk7BrMNgWctMtq0icu8wAo3h9xFm4Kf58z6gEP84lX4qLp+az5
	 lMQ6yVtkJl+QucVcAcvDnQneJW182pz072iMv6eFmPEixhFmq/UUbekFN6PNOCQDPT
	 X0G2K6j/rzSgDX+qXPbi4HW66W6ZukDqNMf57xfXQZFTcXF7d/xo0R2eFPjoRfWYTu
	 07ZZfKq62KXnEjBH9Vq64IpFvBBPv1/j6b3RBqvtcXQ4mpmgaQxivmnhcXyAe9+xiX
	 dq98rf6EbziKQ==
X-Pm-Submission-Id: 4cKmGZ61Bxz1DF4H
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Subject: [PATCH v3 0/4] leds: privacy-led support for devicetree
Date: Mon, 08 Sep 2025 01:18:02 +0200
Message-Id: <20250908-leds-v3-0-5944dc400668@vinarskis.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKoSvmgC/12MQQ7CIBBFr9LMWgxQoejKexgXCFM7UVvDGKJpe
 ndp48J0+X7+eyMwJkKGQzVCwkxMQ1+g3lQQOt9fUVAsDFpqI/dSiztGFsGq4JrGx+gklOszYUv
 vJXM6F+6IX0P6LNWs5nUVyEpIsfO1QqWNbuzlmKn3iW/E2zA8YI5k/S+an6iLiNG11rbGRu/W4
 jRNX3fY3brVAAAA
X-Change-ID: 20250902-leds-c61c877add80
To: Hans de Goede <hansg@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Jean-Jacques Hiblot <jjhiblot@traphandler.com>, 
 Jacopo Mondi <jacopo@jmondi.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>, 
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2779; i=alex@vinarskis.com;
 h=from:subject:message-id; bh=k8iX8f1s+IR8AvU1agIi/j65Y7bAoHiH3WV53x45EE4=;
 b=owGbwMvMwCX2dl3hIv4AZgHG02pJDBn7hDboOuU/Y7Bm/5y71XeXBfdSc5V2Vi/Ow+FbL5qZv
 e48qqneUcrCIMbFICumyNL952ta16K5axmua3yDmcPKBDKEgYtTACaytoXhn96TVc9UZy/TC2La
 fNx82s47pzXi7plIH1RhO+Nycu+K52cYGeYbHT5ebGvptf1JsyOfAGNretiVtbK30qpnTL35MX6
 eKw8A
X-Developer-Key: i=alex@vinarskis.com; a=openpgp;
 fpr=8E21FAE2D2967BB123303E8C684FD4BA28133815

Re-spin of RFC patch from ~2.5 years ago [1]. v4l2 controls for privacy
LEDs has landed, but the DT part was left out. Introduce missing
dt-bindings, and commonize 'leds' parameter. Finally, add a patch to
enable privacy-led on Lenovo Thinkpad x13s.

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
Changes in v3:
- Drop unnecessary 'dev->of_node' check by Andy
- Keep 'panic-indicator;' in DT by Konrad
- Fix property/property-name order by Konrad
- Add missing 'led-names' enum definition for video devices by Rob
- Add oneOf to 'leds' to avoid conflict with nodes of same name by Rob
- Link to v2: https://lore.kernel.org/r/20250905-leds-v2-0-ed8f66f56da8@vinarskis.com

Changes in v2:
- Fixed mailing issue
- Fixed wrong R-by, add my missing sign-off
- Elaborated cover letter/commits descriptions to better describe why
  this is needed, and why trigger-source could not be used instead
- dt-bindings: expanded schema description, fixed s/phandle/phandle-array/,
  expanded the example
- dt-bindings: added patch to commonize 'leds' from other schemas
- leds: dropped wrapper, dropped exporting of private functions
- dts: added patch to utilize privacy-led on Lenovo Thinkpad x13s
- Link to v1: https://lore.kernel.org/all/010201990a1f5ad8-fc97fc84-9ef9-4a03-bf1c-2d54423c6497-000000@eu-west-1.amazonses.com/

---
Aleksandrs Vinarskis (3):
      dt-bindings: leds: add generic LED consumer documentation
      dt-bindings: leds: commonize leds property
      arm64: dts: qcom: sc8280xp-x13s: enable camera privacy indicator

Hans de Goede (1):
      leds: led-class: Add devicetree support to led_get()

 .../bindings/leds/backlight/led-backlight.yaml     |  6 +-
 .../devicetree/bindings/leds/leds-consumer.yaml    | 89 ++++++++++++++++++++++
 .../bindings/leds/leds-group-multicolor.yaml       |  5 +-
 .../bindings/media/video-interface-devices.yaml    |  8 ++
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |  8 +-
 drivers/leds/led-class.c                           | 17 ++++-
 6 files changed, 118 insertions(+), 15 deletions(-)
---
base-commit: 3db46a82d467bd23d9ebc473d872a865785299d8
change-id: 20250902-leds-c61c877add80

Best regards,
-- 
Aleksandrs Vinarskis <alex@vinarskis.com>


