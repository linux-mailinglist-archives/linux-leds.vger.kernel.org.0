Return-Path: <linux-leds+bounces-7261-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id svUuBOdzsGnejQIAu9opvQ
	(envelope-from <linux-leds+bounces-7261-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 10 Mar 2026 20:41:27 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CEAB25712C
	for <lists+linux-leds@lfdr.de>; Tue, 10 Mar 2026 20:41:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B00D306D8DD
	for <lists+linux-leds@lfdr.de>; Tue, 10 Mar 2026 19:41:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60C3E35836B;
	Tue, 10 Mar 2026 19:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ffs/zfmy"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2073570C8;
	Tue, 10 Mar 2026 19:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773171667; cv=none; b=FxKscXzOuujfmj80UrVUS0/qiWmI1QUILd2EZlEx63wGfvvgB7AxXW/BdGERuNdqlCiZ5Slv8JDrsr4GYzRhYY4fbPAPKDIIzCv4sOCHNG7sdn541FmQ/TpFdekXusrm3q68K14VG9GCoQZZTzkv+B80dI+9LyP/sVRMYfEua3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773171667; c=relaxed/simple;
	bh=VHLDxVEfpFap8ExrVtZQHAWAnOhE6qoyz8I5ymlzcVA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TDMtvDM1UxN8I+7d9JMPAIptbUej4bvIX+vf4NocMkRiaHukIlddNxjtzc3lV/xraRChGY9+5DUOVm/tPKlYPdxiGlc/c/xMEhrqredp1mGmaUaNsoT/bJqkgsyvlVxZjMZODUuwuMX02TAJJ3Igbeq9Co/GjZTIPuVDwY9rgwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ffs/zfmy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A799C2BCB0;
	Tue, 10 Mar 2026 19:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773171666;
	bh=VHLDxVEfpFap8ExrVtZQHAWAnOhE6qoyz8I5ymlzcVA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Ffs/zfmyAb/NGz+7KkRXysxhmryLJTWI+lj0cyr0TBPbJVJq/swryCAYnI1Kl3xzy
	 juULVsbdf+tYbC4wJDO27DFEWHFGytLAAKz3/kp5kZWd/WewGjOtrY2HOsQM+nTyKi
	 Bqcj2gx+NO7RLGI7vvkzoVA9VeICAPpsTQSmsqHOSGXAxYrpsYd/VAj6FljxhkZSRN
	 PLyrweThdivoH9954OI/e4yGqzmWWlP7QqEq8obQOgKQQCnDWDAkgGFmC60z9ji0ZW
	 WCQy6sLWGIS4qk+ZsTkAUEz6KlRe46k6thEOFZOf6Vpw1d7wSobgNUBJ/yz1KqFUmi
	 O9bzqg+pFu1XQ==
From: Chen-Yu Tsai <wens@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>
Cc: Jernej Skrabec <jernej@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260302152724.3197587-1-wens@kernel.org>
References: <20260302152724.3197587-1-wens@kernel.org>
Subject: Re: [PATCH v2 0/3] arm64: dts: allwinner: sun55i-t527: avaota-a1:
 Enable LEDs
Message-Id: <177317166417.379398.16412478026363950825.b4-ty@kernel.org>
Date: Wed, 11 Mar 2026 03:41:04 +0800
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Rspamd-Queue-Id: 7CEAB25712C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7261-lists,linux-leds=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wens@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Mon, 02 Mar 2026 23:27:19 +0800, Chen-Yu Tsai wrote:
> This is v2 of my A523 LED controller enablement series.
> 
> Changes since v1:
> - Rebased onto next-20260226 to get rid of unmerged context
> - Collected tags
> - Link to v1:
>   https://lore.kernel.org/linux-sunxi/20260225160828.1687643-1-wens@kernel.org/
> 
> [...]

Applied to sunxi/dt-for-7.1 in local tree, thanks!

[1/3] dt-bindings: leds: sun50i-a100: Add compatible for Allwinner A523 SoC
      commit: 7cb259eacc08df8e5d1b17e6a75a19518e5de7ca
[2/3] arm64: dts: allwinner: sun55i-a523: Add LED controller
      commit: 24cd5a81771d8213abb7494245a7f320a6e75e52
[3/3] arm64: dts: allwinner: sun55i-t527: avaota-a1: Enable LEDs
      commit: cc68a8a3f89c18bdbce33a449c31e6467a3cbcfa

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>


