Return-Path: <linux-leds+bounces-7498-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CC94KLdexGkkywQAu9opvQ
	(envelope-from <linux-leds+bounces-7498-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 25 Mar 2026 23:16:23 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A8C32CD12
	for <lists+linux-leds@lfdr.de>; Wed, 25 Mar 2026 23:16:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C484E301DDBB
	for <lists+linux-leds@lfdr.de>; Wed, 25 Mar 2026 22:16:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDEAA3264CF;
	Wed, 25 Mar 2026 22:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="TzDpLPyo"
X-Original-To: linux-leds@vger.kernel.org
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47BEE749C;
	Wed, 25 Mar 2026 22:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.97.38.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774476973; cv=none; b=poQlw4tHQt/rX67KK8Q4DMFaGuGIoFQCmE+YswilArtekXoEByYikDLr59OtlEhcgGc4iuntI41LgpXjhgsJpR2JV9VjPwvTbZiQKh+rD4wQn0g8HA2inMCNMyBQseRjgQkWjdU/ZbAYm9RXRnp4pDTTn+7bfhNwJYiO7bLZjLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774476973; c=relaxed/simple;
	bh=Z8CurjlzVO6oEEWpQW0GpyYWUWY2tf33N/Sx0Va/zj0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N35regyZD+U4cU4TPKk2a8HVg2CdRy9i+0ZgFfHadt/unuyX/NB26/UE7A1j9Gow8y2kWfgLre08qA+B8cQJeuj1OagfoLARCQfvt1kGXWL31CfmfdZT5j7qBtQzgB44Zb87qkQIf9+yCjlVVr3cO2L/lAuiWfC5JMzsi4zXWyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=TzDpLPyo; arc=none smtp.client-ip=88.97.38.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1774476602; bh=Z8CurjlzVO6oEEWpQW0GpyYWUWY2tf33N/Sx0Va/zj0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TzDpLPyoZ/wAHO/pPjHsoyh120LxTFaW4h80MYAM9rV7YoVt10AHClEUpkrx1kM/g
	 fkMZE8ks/rR0fUABZs55I22AZNxepGnKZoW7aDJhDHy/BfEo8Qw5ReL1xcTb3ZLTDH
	 hxXUqUG0QsDBLANfTNdvay/4oZJtQa6xAPnRer3FEEA1L5MeEpTF0mKmJ6F3QETR6o
	 6kWDqOGHbLe+o80oZY49MWdiRvBr8WgHB/BtZqaoSdscGr2exqcdD3WxiVQ3fX5cKO
	 IHbE3ovO0Hnmw/ZuJUUBiCz/hOVnJ0lZr8ZA46jMMv9QHxKvPv/vS4irV8siawmDIa
	 eWogZfU10xOjg==
Received: by gofer.mess.org (Postfix, from userid 1000)
	id C198E1011B2; Wed, 25 Mar 2026 22:10:02 +0000 (GMT)
Date: Wed, 25 Mar 2026 22:10:02 +0000
From: Sean Young <sean@mess.org>
To: Biswapriyo Nath <nathbappai@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Martin Botka <martin.botka@somainline.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
	linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 0/7] Add vibrator, IR transmitter and USB-C handling in
 xiaomi-ginkgo
Message-ID: <acRdOmHKQmBp-RSd@gofer.mess.org>
References: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mess.org,none];
	R_DKIM_ALLOW(-0.20)[mess.org:s=2020];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7498-lists,linux-leds=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sean@mess.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[mess.org:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mess.org:dkim,mess.org:email,gofer.mess.org:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 15A8C32CD12
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 25, 2026 at 06:07:23PM +0000, Biswapriyo Nath wrote:
> This patch series add support for various components in Xiaomi Redmi
> Note 8.
> 
> Most notably:
> - IR transmitter

For the IR stuff:

Signed-off-by: Sean Young <sean@mess.org>

Thanks,
Sean

> - USB-C OTG
> - Vibrator
> 
> Also, fix some bindings warning as reported due to previous commits.
> These are tested with linux-next tag next-20260320.
> 
> Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
> ---
> Biswapriyo Nath (7):
>       arm64: dts: qcom: sm6125-xiaomi-ginkgo: Enable vibrator
>       arm64: dts: qcom: sm6125: Enable USB-C port handling
>       arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add PMI632 Type-C property
>       dt-bindings: leds: irled: ir-spi-led: Add new duty-cycle value
>       arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add IR transmitter
>       arm64: dts: qcom: sm6125: Use 64 bit addressing
>       dt-bindings: clock: qcom, dispcc-sm6125: Add #reset-cells property
> 
>  .../bindings/clock/qcom,dispcc-sm6125.yaml         |   3 +
>  .../devicetree/bindings/leds/irled/ir-spi-led.yaml |   2 +-
>  .../boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi |  56 +++++++
>  arch/arm64/boot/dts/qcom/sm6125.dtsi               | 168 +++++++++++----------
>  4 files changed, 152 insertions(+), 77 deletions(-)
> ---
> base-commit: 785f0eb2f85decbe7c1ef9ae922931f0194ffc2e
> change-id: 20260325-ginkgo-add-usb-ir-vib-4a51bd9ff64b
> 
> Best regards,
> --  
> Biswapriyo Nath <nathbappai@gmail.com>

