Return-Path: <linux-leds+bounces-9034-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id etOvF3OZUmqDRQMAu9opvQ
	(envelope-from <linux-leds+bounces-9034-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sat, 11 Jul 2026 21:28:51 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8E4742AEA
	for <lists+linux-leds@lfdr.de>; Sat, 11 Jul 2026 21:28:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sholland.org header.s=fm3 header.b=jlW6cSOk;
	dkim=pass header.d=messagingengine.com header.s=fm2 header.b=fJa2ZGir;
	dmarc=pass (policy=none) header.from=sholland.org;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-9034-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-9034-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7E232301226A
	for <lists+linux-leds@lfdr.de>; Sat, 11 Jul 2026 19:28:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BB3B1F3BAC;
	Sat, 11 Jul 2026 19:28:48 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A884499B8;
	Sat, 11 Jul 2026 19:28:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783798128; cv=none; b=D3K+NMgFxTmZ/MRe2tdfNfstTKXTvb0FWhcR92My28XWLJToDB3jA8f9YiEeK7LBVNiZia2G1WeyUkCxICKYhTHxXqDLKfiwltqyXiRLF69lTW97IeC8wBpd4sSwtO+t9TRyT0gfvvbJlsQ8hezepA72ApqpPmEpA5+f0EDtp9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783798128; c=relaxed/simple;
	bh=n9iuU4W59HDRNX9J8q+HFkKT5Zdob663hVpkz4k9N1A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N1Q4tByn3CeUQoimdsm5fxiDd97mb5ckUaDglM9yRWCuwPTfBS124He/QN158mtEhBG1+Yt/Pofwqdl5Q1iUeJ6LgouUilsEiAYEDNpeki0zI9AEbeiT+CeRxkqTRvNCjG43J/QnUV2VQiJsfvfhrOvUpCEhNUObUPzrzvIe1D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sholland.org; spf=pass smtp.mailfrom=sholland.org; dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org header.b=jlW6cSOk; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=fJa2ZGir; arc=none smtp.client-ip=202.12.124.144
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 494D81D00082;
	Sat, 11 Jul 2026 15:28:45 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Sat, 11 Jul 2026 15:28:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm3; t=1783798125; x=1783884525; bh=Bxi0tIJBTHMG2GLAxKRyz
	HlO5PVp8JXAquIokUPhC7g=; b=jlW6cSOkha6VOPPLcr+2rZNVITVDfT+jzJ7kF
	KOG7RosscJVNmqSbhlcuF0ejGauWbOXgQ20gp1N2/2/WtSohL+T377beSu+YgMUy
	7w91vuLfRobfU/E+TZjVmCkdajiczhPX3b3vbwwnUuneKYqYRa9gSGQLys/HpcvN
	XDgz3ifUmd2It8VMrY8D5Z9JSDVDeTcasld6CZmkidTi/e+MusW0Bwac692wLTeE
	JYTcVMqAetHH3kknD7bUv6VRa54KWlIgHWU3S2gY7vsbl1so4hFpApHhWpd/YWd3
	qKho8nUH2dSDq5iXKjlA1rhlrrIbi0+7YKinJ3YUWcgWL2l2w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1783798125; x=1783884525; bh=Bxi0tIJBTHMG2GLAxKRyzHlO5PVp8JXAquI
	okUPhC7g=; b=fJa2ZGirBrrn9K2GLajyPQLQ6FNT5ueXJGemZ7UdGiyqQeGvsn7
	m3AwiYvaLIOlsqKzy4e4dygAJxpxObvBXub/MWkYJVrMYBfE5hT7Q31cYag10KrB
	oIXnTHtUoX4yoLnKWY2RAWkfGoclyKp2HPG40mxuX6xMCUg1Rn316STx6iSe6zue
	sP4d5LROzUJlpWlP87r5XOH7SGP7MUbI6xU+BEad+ZtaS4lhu0Bx5EUHWnE/Dgnz
	luO8//8SPb4smVQqEKjXAYCmZDWQe85b08gRuhrpfvaPHcsu0P5fZHwnDneCKHhz
	IzqUdBfrsl6c65psi7MFp9n8AZdKXkjY6pQ==
X-ME-Sender: <xms:bJlSalTYXKJqK1g5XO3JLIHVf5FYTjOsB5gwoktGXOqzCS-fK6pZFQ>
    <xme:bJlSalQzwTbj0pvmxKosUvPvaCiWhsVo1uULTFA-JLi-l4tbgxPe525_pbaLv70EM
    L5cvDkZqmrehOLPWkZtt-mdPPPBYurjo2D4AHoRiCTmhhWBIAHYCcs>
X-ME-Received: <xmr:bJlSao1duqa0pc02U8In3G1Vj81r9BYrTNOtPRPbjPGQhmj1GpbwAWaBS46SGhsIspJz2xfhjH1dWMKAymvHHwjFHa1wNf-wC0Pa8Sso5fHiiZ4l0EE>
X-ME-Proxy-Cause: dmFkZTEvfD0G2LPRWixeRxfokGmUFKLCtPqKeNMCJTyU24YvzEGRIiEmLZ5hUoHzQ6zhNA
    5fDLipFLSSvG9p2UkDpP5bP5rv0UC3te91u2jXc2PdCYjxdCfGu0IwkIW28yHlz9syQBSM
    TN5Ml5t/q4T9s5EKVFAzJD2vDheQpT0DgEkLBxeIcXuvYLoimT71nTz4DGYMViNAL3IwXA
    ezL01PC/0NiBm0RwqmFOq6c3dZbJRnzOOE816EjPHtr/D8OmoaEGd/qknhmy04IPTYGxTF
    47AjcxS2usfbM9SehLr83VVlJL6CvL1PoK3H+8lYy9w43ul9YEdwydSIk0KmOp3rpi9ylt
    GF50zPgstQWUnwZEzACRcDdLpdWX+KjxQkro0D8rgUJTpzFjOd//AzM1tOaF5BfA21Rpbb
    AgjX2BHxw7JZKqD/4bwTBQUFLBt8O+UlFbRo8eoVjbdxklZPlH1k0FPPvKPSUs1bPIN4ZX
    I5hPx4CzIXMJ5ZX/5zU9wUm3CfpTG4C/qOMo2xirMAOTdvZVmjYHvJuyyI4Tb1jTWtqbee
    hk1UUojKOf22o/Q6E62tdb2zAXQ2cTepQ3djT6rexaNlBJzV1iM6uh8f8PUzUMHF+aN9tB
    vu3nq4MLRebBtrVMo37D1rpVa5+B/mPrnwJGYSScCDdtK9AzVWNhq34AGwFg
X-ME-Proxy: <xmx:bJlSavzODP9cIbNRgWg4b0iBmT2AoFzL9HMM1KaMwAzDys1SoQBzVQ>
    <xmx:bJlSakxsqOxrnMvL8J1IAFRhLpisRWAvDF6ExoZkhqssMvoNWUWp7g>
    <xmx:bJlSar9X2HA073WcSt5fdvKlHclKcOfEpUaljHbtudgUkfT_Jr0SWw>
    <xmx:bJlSau9DfrijqEGZJ4762WFbTLmtri91-m5SKbrvnpz1qiPtxsm3Qw>
    <xmx:bZlSaqTe4hhmeU8lSL7p3RbOODBoJOxLUE5f8FwsjzhvlZ8KSEZNWxSQ>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 11 Jul 2026 15:28:43 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Cc: linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Samuel Holland <samuel@sholland.org>
Subject: [PATCH 0/4] Add devicetree for LincPlus LincStation E1
Date: Sat, 11 Jul 2026 14:28:24 -0500
Message-ID: <20260711192842.845048-1-samuel@sholland.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[sholland.org,none];
	R_DKIM_ALLOW(-0.20)[sholland.org:s=fm3,messagingengine.com:s=fm2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[samuel@sholland.org,linux-leds@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-9034-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:heiko@sntech.de,m:conor+dt@kernel.org,m:krzk+dt@kernel.org,m:robh@kernel.org,m:linux-rockchip@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-leds@vger.kernel.org,m:lee@kernel.org,m:pavel@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:samuel@sholland.org,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[samuel@sholland.org,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[sholland.org:+,messagingengine.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BE8E4742AEA

This series adds a binding and devicetree for the LincStation E1 NAS.
As described in the message for patch 3, it is not entirely clear what
the DTS file name and board compatible string should be, so for now I
went with the marketing name for the file and the OEM model number for
the compatible string. This mostly matches the vendor firmware.

The vendor software provides quite limited access, so the unit must be
disassembled and the board removed to access the UART test points
(opposite from the power button; Ctrl+C to interrupt the vendor U-Boot)
or the eMMC traces to force the SoC into maskrom mode. The vendor
firmware uses rk3568_ddr_1056MHz_v1.25.bin from rkbin for DRAM init.
Mainline U-Boot 2026.07 works with no code changes when configured with
this devicetree. It is recommended to enable the fan as early as
possible (e.g. `CONFIG_PREBOOT="pwm enable 0 0"`).


Samuel Holland (4):
  dt-bindings: leds: Document "gpio" trigger
  dt-bindings: vendor-prefixes: Add techvision
  dt-bindings: arm: rockchip: Add LincStation E1
  arm64: dts: rockchip: Add LincStation E1

 .../devicetree/bindings/arm/rockchip.yaml     |    5 +
 .../devicetree/bindings/leds/common.yaml      |    2 +
 .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
 arch/arm64/boot/dts/rockchip/Makefile         |    1 +
 .../dts/rockchip/rk3568-lincstation-e1.dts    | 1004 +++++++++++++++++
 5 files changed, 1014 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-lincstation-e1.dts

-- 
2.54.0

base-commit: 8cdeaa50eae8dad34885515f62559ee83e7e8dda
branch: up/lincstation-e1

