Return-Path: <linux-leds+bounces-8054-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cOMjM+cA/mkBmAAAu9opvQ
	(envelope-from <linux-leds+bounces-8054-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 08 May 2026 17:27:35 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6994F8A9B
	for <lists+linux-leds@lfdr.de>; Fri, 08 May 2026 17:27:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 251C230265BD
	for <lists+linux-leds@lfdr.de>; Fri,  8 May 2026 15:25:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8139E3FA5D0;
	Fri,  8 May 2026 15:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ctz1wJui"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E613F7AA1
	for <linux-leds@vger.kernel.org>; Fri,  8 May 2026 15:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778253923; cv=none; b=SqexMtGGBFOp9VLeeG38CLperdBM5iIpPMatO2V/Wr7uhvd35KQix6rMyX4O47EFMjWWfp6B1EFMVr4bDfPTDQsJwmkA2OaHTNNSJFCrAaDbu694eVP7i31H60eznpaWpe2ReHDoLS9aod8bWe2n/whDXYiOU5VfY23dw/iSA/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778253923; c=relaxed/simple;
	bh=RSPgHsHKv3HIrehtClGsNwtFl5zAlbG9AEbp2U8tqtA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a7kbChOiqeqQh+ywgDxhj25Ut4SyRB20BciK5agZusOi3AaeSirqamqKtMqLHGLT6dCU39iIAhdK2N9wtDs3/YUGxOMLFttgTwUhkFz1inlq2qEw6fJ7B8lGAlhD4/8Jbma3PbyWv/Cg5jUR7ndMG7T/XM+4qPJbHJq4wLXlG0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ctz1wJui; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2ef2a1cc06dso430441eec.0
        for <linux-leds@vger.kernel.org>; Fri, 08 May 2026 08:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778253921; x=1778858721; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TRoQ+3Yekl1sBGcIilVshMHtKIfsx7cqVK42rev6z2U=;
        b=ctz1wJuimUDdg7t0nXpjXKv8S4b97HhfvkiXTBKoS96VabLDxZkXDJPAxDxsgmK1sP
         ZVN2fIdgx9PB354V2okPs062GUhanMOokn3hWu3XGWHwF2dNkPZtsLCmq7cOLIUFjXeJ
         V9IiVH7lrJMhlNZ1T7PbCIlasYlZOjqrxTKV1yihr4SzwvwPPwEi7cr951pg4TpHGzss
         lc5i7yipQD5BAF3RbvJ41QMN1+LHJr+syk5iQm9r+qKascxOkpchGlPtXACNGpTqXSMZ
         EdJ3Rpaa7kK9QRuy5+WJwUdVkmmbVTESUrGU7ltvSC46mKYInT01PdUocsGQmaNUvgTo
         Imdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778253921; x=1778858721;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TRoQ+3Yekl1sBGcIilVshMHtKIfsx7cqVK42rev6z2U=;
        b=AkscPusCnFI9d/jIaXSZF6CzRDkFzO2sH+6/jwzSoEtlFdPDKrXC/polAK7sK++Glh
         TJvxwK2jBHwfbW89RiZ3YP8ml+XmdZDFxLaOFOta+W4PkAEH+7M7+5xNyoM1OCtvAosH
         ZAMFsRlYD3mFwR1h4lcLALkvtiC1okz85xPfw6NIV42bBgRBImGbVxT2yEvqro6KjQyG
         WEB/3r9Kd+IN84VIzqEkNKaaeSiJ5oF066DyCNtrB5sAiOuu1jE+8QvhXQY7lHstfJ9x
         Nnf1uB41MA4IVnd4OI9+nZjMa6sA1JNdoUVMnAsCk4cnENDNJle1wKkPeR7E/1+D6on0
         Y59A==
X-Forwarded-Encrypted: i=1; AFNElJ/ojYf3LAago5SqPBbHaiLp7xjbx6Z21ntCGTYFvKUmfmhszRxbGqj+eXcq2oaHJfGWub2S+lFqq/3m@vger.kernel.org
X-Gm-Message-State: AOJu0YzS6TPKKua53Z+D6raY68zh6LqPY8Yq3qsr6MEKHXqSTs0OiRR6
	x7Wts8y/a3/Br9EdA1qbfptIHWOi1ZrYIZ4MVbvMTXkzvolJhcI97BA/
X-Gm-Gg: Acq92OGwP7BpOFs2ltD6Sp873xezpjxfYc82dhzA/LBdQb6YWWmHyYA5hOsEHV3hVhf
	hA2ew2MuPHA8rkITaDn15S9x+/Y50OHy9xy8SyYWUe5/DKAb7iNtheovROC5OILKwoaTVehbdOG
	Eq6+jb9oFqFrOR9lvCIV89hjYOjfqPCkEA2U3m2mS5ZTfH48ewqhvtG8kT/9R4M/J4UIhD68cw2
	ZjyBO+e1G4osEppvEYZitNZYCYvkLPixFyVIdmeckMF/qYWYgsDK9j3EhW2NoEwqmQvzVDF5hw4
	R3Z+UMsQVR5K08a4doGoyErLRYzryAAbTaXUHirqRi461Xe1xLKwaH7rmzPI0MkMItu3KV4sqZL
	qYNl8EG5MagaIMbjLzW+ksTBdCDmP1pwnC9Vxout6O4pUDZ/FGZZEV1NIcCH6Gfee+vLqUeOYX1
	Yu44VLjgfNpv4WUmc6MbgyAicEnIBgPSVcueL/w/tIQZz+Uoo=
X-Received: by 2002:a05:7300:d70d:b0:2d9:6373:ad10 with SMTP id 5a478bee46e88-2f548065445mr6402720eec.7.1778253921033;
        Fri, 08 May 2026 08:25:21 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a53:11:5d6e:9aed:ce1b:4ae9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8862d43b4sm2535486eec.11.2026.05.08.08.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 08:25:20 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Vincent Knecht <vincent.knecht@mailoo.org>,
	Grant Feng <von81@163.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Baruch Siach <baruch@tkos.co.il>,
	Nick Hawkins <nick.hawkins@hpe.com>,
	Robert Marko <robert.marko@sartura.hr>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	Pavel Machek <pavel@ucw.cz>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/5] leds: is31fl319x: Fix shutdown GPIO and update DT bindings
Date: Fri,  8 May 2026 23:24:17 +0800
Message-ID: <20260508152435.21389-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 6D6994F8A9B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,ucw.cz,kernel.org,vger.kernel.org,lists.infradead.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-8054-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,lunn.ch,bootlin.com,gmail.com,mailoo.org,163.com,arm.com,linaro.org,tkos.co.il,hpe.com,sartura.hr];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jerrysteve1101@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

This series fixes incorrect shutdown GPIO polarity and improves
shutdown-gpios description in DT bindings.

Patch 1 adds detailed shutdown-gpios description and fixes example
in DT bindings.

Patch 2 fixes shutdown GPIO initial state and removes redundant
startup toggling.

Patches 3-5 correct shutdown GPIO polarity in board DTS files.

Jun Yan (5):
  dt-bindings: leds: issi,is31fl319x: Add description for the
    shutdown-gpios property
  leds: is31fl319x: Fix shutdown GPIO initial state and remove redundant
    startup pulse
  arm64: dts: qcom: msm8916-alcatel-idol347: Fix sn3190 shutdown GPIO
    polarity
  ARM: dts: qcom: msm8974-oneplus-bacon: Fix sn3193 shutdown GPIO
    polarity
  arm64: dts: marvell: armada-7040-mochabin: Fix is31fl3199 shutdown
    GPIO polarity

 .../devicetree/bindings/leds/issi,is31fl319x.yaml        | 9 +++++++--
 arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts | 2 +-
 arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts     | 2 +-
 arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts     | 2 +-
 drivers/leds/leds-is31fl319x.c                           | 8 +-------
 5 files changed, 11 insertions(+), 12 deletions(-)

-- 
2.54.0


