Return-Path: <linux-leds+bounces-8948-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yOV9JRlxTGpjkgEAu9opvQ
	(envelope-from <linux-leds+bounces-8948-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 07 Jul 2026 05:23:05 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C372717033
	for <lists+linux-leds@lfdr.de>; Tue, 07 Jul 2026 05:23:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=GkGBTtwg;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8948-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8948-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 701A7303515F
	for <lists+linux-leds@lfdr.de>; Tue,  7 Jul 2026 03:22:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E94537F8C0;
	Tue,  7 Jul 2026 03:22:10 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E4B37266D;
	Tue,  7 Jul 2026 03:22:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783394530; cv=none; b=MbATW9+i0lD8MxJeY0EbNoeGKN0xme0gYpPMsgn2hPu+6fSD2QDAVs+Vqwdgx+aLQGN9PwAxzISECb8yyJnyIn4ZXYpJcfqD8YSBO8z3+aQeA3G+6KUi/6zy0Sx+guCLBI5VQKuoQtdb67HEwRD4QHRBjrTLARW5PTsokUvO3m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783394530; c=relaxed/simple;
	bh=uifYgKU3HWleDJ1V51l/6/3x0LKaVLQJVdYJHTT2Nk8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RHHqrIhvUCat7whvIXYwexeG+0GzRhCVRv0rSq/DFxXwwpGdbVdD3UaGNOIBfSmfQ/yBvZmLSbOCYqkT4xrnq/L4D7kDX/g6ZuIMGCzF7tVYZv5yg4GHVMSBvQqxwkKVTVt4UL34B3j919IPOwxSbbzrABFej78qQuVwk1NFa74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GkGBTtwg; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3B901F00A3A;
	Tue,  7 Jul 2026 03:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783394520;
	bh=Pp3QGx4MI0wMm1/tu5AIhwHgnRl0wO+oCUAfozdxYPU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GkGBTtwg3fkvelnnB9ePsx319TKYpkyY120ukz7J9mXwDL3F2SzlhOQXOykAPNXSt
	 T9hTCoVaRJNePFrs/NDXVp9wnzqatoW7OMOdbknTQe4P2M33cfbuNxRW1tDwUvEfYl
	 nBCh0bG1DBfJOf5Xg7RmIxDkxQUIeZnxvrZQsCAOCC2QNoSqb067N2oG8Yl7LQIwer
	 usfq7vYi3tzceYNHbKDJblKy4Z9Q7q2t3rW9isJVflPWzWU90TN5g6OHh4KHeiQe1O
	 FB814nrxxka8MCU/ItGGi5evHQqyZLk7NJMLo5TpplcLD+OcCau2vm+UB1jehnriqH
	 5OBWbiPk5xgew==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Sean Young <sean@mess.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Martin Botka <martin.botka@somainline.org>,
	Biswapriyo Nath <nathbappai@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-clk@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	kernel test robot <lkp@intel.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v3 0/7] Add vibrator, IR transmitter and USB-C handling in xiaomi-ginkgo
Date: Mon,  6 Jul 2026 22:21:33 -0500
Message-ID: <178339449904.1938770.3052050232768803324.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260330-ginkgo-add-usb-ir-vib-v3-0-c4b778b0d7f8@gmail.com>
References: <20260330-ginkgo-add-usb-ir-vib-v3-0-c4b778b0d7f8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lee@kernel.org,m:pavel@kernel.org,m:sean@mess.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:martin.botka@somainline.org,m:nathbappai@gmail.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-leds@vger.kernel.org,m:linux-clk@vger.kernel.org,m:~postmarketos/upstreaming@lists.sr.ht,m:phone-devel@vger.kernel.org,m:lkp@intel.com,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-leds@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_TO(0.00)[kernel.org,mess.org,baylibre.com,somainline.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-8948-lists,linux-leds=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-leds@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7C372717033


On Mon, 30 Mar 2026 10:13:47 +0000, Biswapriyo Nath wrote:
> This patch series add support for various components in Xiaomi Redmi
> Note 8.
> 
> Most notably:
> - IR transmitter
> - USB-C OTG
> - Vibrator
> 
> [...]

Applied, thanks!

[1/7] arm64: dts: qcom: sm6125: Use 64 bit addressing
      commit: 88f8e2ca76ee9999c1f21d020362e6588a6d5ef5
[3/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Enable vibrator
      commit: 222f161a873f198301497f22ae0dd089f30e9b75
[4/7] arm64: dts: qcom: sm6125: Enable USB-C port handling
      commit: 3df39679bfcb46a3475b0e8d0b31cfcb07def9c4
[5/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add PMI632 Type-C property
      commit: c1da9374c3e08c6eb06106256cac3875fb5c467f
[7/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add IR transmitter
      commit: 474dedd7f653be26ce5385f46ff2b7a3282a359f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

