Return-Path: <linux-leds+bounces-7488-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GyXGOclxGm9wwQAu9opvQ
	(envelope-from <linux-leds+bounces-7488-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 25 Mar 2026 19:13:59 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0419432A5CF
	for <lists+linux-leds@lfdr.de>; Wed, 25 Mar 2026 19:13:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1223D3034DDA
	for <lists+linux-leds@lfdr.de>; Wed, 25 Mar 2026 18:07:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F60041B362;
	Wed, 25 Mar 2026 18:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YGNxcxjU"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A67410D14
	for <linux-leds@vger.kernel.org>; Wed, 25 Mar 2026 18:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774462057; cv=none; b=oHBCujNDEmNdB67v1PyxweGEGBWi9/RneiMndQuc+aCXAGMsX4W5ov+SGxTBpBUEn42SzKoolZfFDIJLeav7c0ojoq22XMw4YOTO7VWsmq/auxL2gzGdjLP6xqwA5pbkydmMxpqlC1iY7fFU+7xJejGbae2viSR+G1jTZZiFB78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774462057; c=relaxed/simple;
	bh=JX1VT9zgv0Pae5sCQylMsKS3FziR0eu/Z48DU4Modf4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YIlSSo8bFiUUN0xPrX2fcuhL5b2waZ9L3mKj0rH5xNDUp8iH/8wrBWqVdr6zV7WS59+TNhKOkb3Hn3v3vy12FHAq2jgS8yi16/a+ROk3a5qsue0HddjcwqcAZJSuFsRBEODAd19RA+7Ut5CRbuTN+Op5/ov0OoPT2UBFkYbkyVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YGNxcxjU; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-35c1a131946so210113a91.0
        for <linux-leds@vger.kernel.org>; Wed, 25 Mar 2026 11:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774462055; x=1775066855; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=28ojK3/EzMg1N1ScywDMizt5NQH1Eo8ilmYAqBf6aac=;
        b=YGNxcxjUtxqB0bxk2tWvfN7+xR7w5l4EPzffIkE9kPmXTlICzJIeyPZ9R8Wemy0aZf
         km5qypmOEeEiuh3nm0eKfELVG/WyEKJ/ZS+vxmpUZUg4ykLjpIfIpCH0Th+bcobdDkgg
         M4FPuIkKLRcPUk99D/yR9Bh6/kZ0Kd4VGmnMC2uZB1oMnayFNY4hdo5QiD+p8DAFoHyJ
         82Z7k45+bhOaVT+9oVGwkMnZgUxtvVGS+6nBTSS4EPVxD/+xVREtqLxunwogYzdC1np/
         ttQ80lwe6wOeD52LxyW0LtjUtkMNIn+/ehhJ3XjMIl4OjKjuzUHpY7ObQJtDXdpKhZf5
         bxIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774462055; x=1775066855;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=28ojK3/EzMg1N1ScywDMizt5NQH1Eo8ilmYAqBf6aac=;
        b=bugSK+owSQKF8Lo8opOOJ+haP9KNFZuZ1jNmOYXXLOBnc2607jtVnakkbMAxZgBC9R
         EkJzytJ30oag4FaqnFm2yYFh64CT4CUTrJ4HCdYNmFIEE+DTYvnMC9m5h/KZRlpIfcEH
         le1svhwfW073XnSX37oJJaaaSm/AElXGHkERNREOnBaMwNmY8XqDvuG/0V3AP3I4X8eF
         bkjVpNf3vRAGJiXR/gzSBtAX1xw7SrlfnP8sPOUT5Vh6N161JkQRwzFb3L2rXgu9/9ll
         gFgsw0iSW9X49lsfgBZI9Er6wWsEwR9aBbPgMXgALM2NURAyBtXOGTGuLfd8HNU3FZ6A
         4x/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUlkXaZg4pkqRCjiCZfP1+xSFo59XFPMbdmb5B4htTHZ6dpyvhsrPI1GWAuJwasOm+oiXVi8FV3u9l6@vger.kernel.org
X-Gm-Message-State: AOJu0Yx57I8S5qzXenzYu9zOJp5S9mhp75KI9Cgin/Bx7j2XSoRH/SAd
	qyK7mZxARjcKbfRjV8ebd02S53bz+1F5+O99yym9C38M1rFVUkRrkBKp
X-Gm-Gg: ATEYQzwp31qRN/PsWWOlO+JeHNdhjjEfaM5JOev67JC9kN+EpHuYxIpZsLkFDqXncPc
	856swqfDibuB70VYDbFl6hMdwARxjM7/TmH/L65PqNJjtfMbZHsltCjUWXTocMDfSs13o3VmNEf
	YP9OWY8ulqQ+A4FJTJtUBIjL9cQRHYJlywzKjVte8GrszGOsp8qg128xKi5DReguNt5NnZFIWO+
	AF2d2tw5TekfsR7OquO5oOy4QaPtR+P+xQx0E+2sftcXF6voE6pmDJj2+/9GCYUeXNnfuEZGwa8
	rxNcWCy0jj0CVLCZWaxap044jXKMv4AbXr1Iyhv/TDqLEJFGuS97c/xl3xVYOslVg0cHPO6D89T
	9JrFCtgTC/8thjLePpgmlnq2/xRhD3sBtgm6J1ccIPtpsT714aCUx1zrGJIjRjFY/vspsrQeRdc
	S5B3kEjslvLjnd4L11V8mbdxtHfJv/
X-Received: by 2002:a17:903:22ca:b0:2ae:cd8c:bd04 with SMTP id d9443c01a7336-2b0a4dace22mr76613765ad.10.1774462054938;
        Wed, 25 Mar 2026 11:07:34 -0700 (PDT)
Received: from [192.168.0.102] ([43.251.91.187])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2b0bc773b33sm5687805ad.10.2026.03.25.11.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 11:07:34 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
Subject: [PATCH 0/7] Add vibrator, IR transmitter and USB-C handling in
 xiaomi-ginkgo
Date: Wed, 25 Mar 2026 18:07:23 +0000
Message-Id: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrDugqQrtVaSLjJnEaSFKRkUQ7
 96oy7f4fwflJKzwLnZIvIrKGDOqRwH9YGNgFJcNpjRt+TQNBom/MKJ1DhcllISrENa2qci9vG9
 rgtxOib1s17f73NaFvtzP5wyO4w+tnvDleQAAAA==
X-Change-ID: 20260325-ginkgo-add-usb-ir-vib-4a51bd9ff64b
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Martin Botka <martin.botka@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Biswapriyo Nath <nathbappai@gmail.com>, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774462047; l=1316;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=JX1VT9zgv0Pae5sCQylMsKS3FziR0eu/Z48DU4Modf4=;
 b=FTGDeN4f4HSu3HsrxdqeKr4af3eKQ0NpAJch2iaq19oGsccNrLS+g9iaX+SYWX5PAjLHHCMD/
 G3XSfR0V/MdAl0iw07TAOtfNpDU4LgFGi2V9fIgH6cXkpvWlUy1Kr8m
X-Developer-Key: i=nathbappai@gmail.com; a=ed25519;
 pk=slmb/9yXbet+KTiT3EYLCp0p0MEOYa3EdjUXP+HXfjg=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7488-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com,intel.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathbappai@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0419432A5CF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patch series add support for various components in Xiaomi Redmi
Note 8.

Most notably:
- IR transmitter
- USB-C OTG
- Vibrator

Also, fix some bindings warning as reported due to previous commits.
These are tested with linux-next tag next-20260320.

Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
---
Biswapriyo Nath (7):
      arm64: dts: qcom: sm6125-xiaomi-ginkgo: Enable vibrator
      arm64: dts: qcom: sm6125: Enable USB-C port handling
      arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add PMI632 Type-C property
      dt-bindings: leds: irled: ir-spi-led: Add new duty-cycle value
      arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add IR transmitter
      arm64: dts: qcom: sm6125: Use 64 bit addressing
      dt-bindings: clock: qcom, dispcc-sm6125: Add #reset-cells property

 .../bindings/clock/qcom,dispcc-sm6125.yaml         |   3 +
 .../devicetree/bindings/leds/irled/ir-spi-led.yaml |   2 +-
 .../boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi |  56 +++++++
 arch/arm64/boot/dts/qcom/sm6125.dtsi               | 168 +++++++++++----------
 4 files changed, 152 insertions(+), 77 deletions(-)
---
base-commit: 785f0eb2f85decbe7c1ef9ae922931f0194ffc2e
change-id: 20260325-ginkgo-add-usb-ir-vib-4a51bd9ff64b

Best regards,
--  
Biswapriyo Nath <nathbappai@gmail.com>


