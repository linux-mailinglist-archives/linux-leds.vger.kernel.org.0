Return-Path: <linux-leds+bounces-7547-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qIQPABqvyGlPowUAu9opvQ
	(envelope-from <linux-leds+bounces-7547-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 29 Mar 2026 06:48:26 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 569DE350AC7
	for <lists+linux-leds@lfdr.de>; Sun, 29 Mar 2026 06:48:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EA59030297AC
	for <lists+linux-leds@lfdr.de>; Sun, 29 Mar 2026 04:48:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0205283C93;
	Sun, 29 Mar 2026 04:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tHi3mCX0"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE6D1F3B87
	for <linux-leds@vger.kernel.org>; Sun, 29 Mar 2026 04:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774759690; cv=none; b=d9d+yHRMVDGctL28W3aU3f195Aq78iCqOSTsAYS3hQUWC0a4MZFCLyMuvZ4JWqbfyvR82LbTNtWmOw2Ni1hDytPE0alS7b4lmP3WQLBN6S+Up8j1yMfJPPFsyFV9LCZEQaAkbb+smHu4VWVO9zbS2U2nWHvS2BtvIH1q2bUq7UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774759690; c=relaxed/simple;
	bh=f6G2WzAX3URkZuJNybDd0oFR9WsBJIh/VoQ78JaFB9M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=U8EYDF/ys41NuvK+vljWgin3hXW7jAiEZI8EUXJ8YnFhuShrSAbSE0x37BZu/NjWAqHW9oGSlmHIwlD6DxpmsL82nYCe2dqmSuG/gU/VWUe+6PhvWS09lwL6N4Qb8UU7A40lLGLBukx+sHqOAIy2ZGo/FGMj4xqcpn0UnqQWwLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tHi3mCX0; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-35c238f1063so1614734a91.1
        for <linux-leds@vger.kernel.org>; Sat, 28 Mar 2026 21:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774759688; x=1775364488; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xx2r6QIRxbtt4fGLDrALPMrVxytOCTyVK9i7G8L9agk=;
        b=tHi3mCX0nrFGzYvtMOl9okz0ng5gptQSpHWSjaQEgsgM0aKYqEAn8qWCdCS3K1Rahi
         kJwZ2Z4e1AZHzKM45VwCdrG6CJXrzAO9DhOopYr5xFObn/6yvwW8BPXt+kSgQ0LqD8fc
         odEb3wvVpkB79J95+m8/fUMPZnEdyaSuFHCGZY7iG1VGT+JxOh7hCAXtEwc/BgDAzl5c
         +LM6ZPnYR+H6UdoHPA04vqt8rCb9o2iHHcRlHDIu0vhmfHe57/kOmn61Y9cXKbIZAwTm
         b6SNe9by8B51LjCOm2eEhG5VeHU30cXO9xN4mK9F1bskqJbic5wAmuAAdxabH0f8eunF
         lBNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774759688; x=1775364488;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xx2r6QIRxbtt4fGLDrALPMrVxytOCTyVK9i7G8L9agk=;
        b=f22zY071cizNqYbeN9WaD8X/W9Irji/bK5ACdXbH5RZ19TU/x/ESX1aTxUqt6IdVlv
         avIxwu/kF2jGStAOzmA8A+jgxf1tqyOS/3eMK73SNqRM1wSfA9QgX6sloOm/RZsXcpiG
         ApteHpUvPD54MpQdef2XQtbi/HzIQhU849zaxxtkeWKxH4s7hry8JaH7z7yDZwgnHjBb
         7KgJa9Uwifh9kzyWQAsOk5QLmMh9V35YkhwLw76aLIJE6D2NQ6/PMiHprt5vRK2a5bUC
         hKz5520TalWaFMdWktV2oWg/X5+NIMwWxUkIBMrgAzNkcnYjyx66oqgRfgKr1j5EC7vq
         pvNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVD9tnNmK15m/IgUzX+cTXVeEdFq55UbvbLacsmKuqdaDYahKMDiLrMAjeYQIlDJWfxQogF4lS1ouWg@vger.kernel.org
X-Gm-Message-State: AOJu0YzWCjePvk1qJ9piGUK3DSZXgyNdsSKJFumjS42Cq3FkTXbcp7Gf
	gC7W+UKI+1uD/hlMDtt0d7oWUfn7I3XSPhO1AFZ1neEeY9v5eW6C/gt7
X-Gm-Gg: ATEYQzwxg7VM5owzyUREbjBhhlKo9+C76C3DrBRWGMKQbOjK4pY4BWHydBQZqyMYU9p
	YGsQ5ILCHze0XRmoBeTLSpmHMlyJtAvJ004P+YyGnrCEVA0IAkbK/+FxMcnNBylLCro5wZl6/7R
	HgAhaoMKeZa0wwNFAN1Vs4YiLD+Ms/lidcryshFL2WGI8/NemyKxU4lKvxj5YTqxTeTXbx6IYwJ
	PDJUN9Y7EBpAXmfu+g7k6yxIjVFRza4dK0w4Y/fXyEoCEnIAskMDu4BpkK/Aw6gYjqJ2prNCV7l
	Ngs/7fNKWvk9xclFhTClu1GBqNft4a4w6cwmNqVdjPYVD5fCqD91RQOjvTcDgSYrqnDi2zpac0A
	Xw7Flt8XKf9uc8791ji9co8jVPsUGPR2PDhnpjZwOuhEZC/2sj5H2kVcs8B7InXJ7PjpJlE0KOD
	zG8EUWskJrZVS50QlJbzF9uR49ZRuP
X-Received: by 2002:a17:90b:568b:b0:35b:929f:7e8d with SMTP id 98e67ed59e1d1-35c2ffb71c6mr8601810a91.14.1774759688136;
        Sat, 28 Mar 2026 21:48:08 -0700 (PDT)
Received: from [192.168.0.101] ([43.226.29.240])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c769179e31asm2899739a12.17.2026.03.28.21.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 21:48:07 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
Subject: [PATCH v2 0/7] Add vibrator, IR transmitter and USB-C handling in
 xiaomi-ginkgo
Date: Sun, 29 Mar 2026 04:47:55 +0000
Message-Id: <20260329-ginkgo-add-usb-ir-vib-v2-0-870e0745e55e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNTQ6CMBBGr2Jm7RiopVFX3sOw6M9QRoWaFhoN4
 e4CHsDlS973vgkSRaYEl90EkTInDv0CYr8D2+reE7JbGEQhVHEUFXruHz6gdg7HZJAjZjYodVU
 ad24aJQ0s21ekht9b91b/OI3mTnZYY6vRchpC/GzHuVy9fx+5xAKlVFbRSVXaqavvND8PNnRQz
 /P8Bb9+ZlvMAAAA
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
 phone-devel@vger.kernel.org, stable@vger.kernel.org, 
 Biswapriyo Nath <nathbappai@gmail.com>, kernel test robot <lkp@intel.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774759680; l=1503;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=f6G2WzAX3URkZuJNybDd0oFR9WsBJIh/VoQ78JaFB9M=;
 b=d9YzlJl/hSsImV6OyJqHuobkqxYz7w7c6plyfLZZLB1c9PyIG1VTX20nB2+mxVAKD7WGucFCZ
 CzIXOF3cnG/AN8wGovKMCREi8EE5Dx03Q93AWYMnUfz0FSU0FfnIkS3
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
	TAGGED_FROM(0.00)[bounces-7547-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com,intel.com,oss.qualcomm.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[24];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathbappai@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 569DE350AC7
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
Changes in v2:
- Move bindings fixes to first in the series and add fixes tag.
- Link to v1: https://patch.msgid.link/20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com

---
Biswapriyo Nath (7):
      arm64: dts: qcom: sm6125: Use 64 bit addressing
      dt-bindings: clock: qcom, dispcc-sm6125: Add #reset-cells property
      arm64: dts: qcom: sm6125-xiaomi-ginkgo: Enable vibrator
      arm64: dts: qcom: sm6125: Enable USB-C port handling
      arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add PMI632 Type-C property
      dt-bindings: leds: irled: ir-spi-led: Add new duty-cycle value
      arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add IR transmitter

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


