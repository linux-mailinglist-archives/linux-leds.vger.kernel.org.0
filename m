Return-Path: <linux-leds+bounces-7643-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uE71Ogmr1GmKwQcAu9opvQ
	(envelope-from <linux-leds+bounces-7643-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 07 Apr 2026 08:58:17 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F23FD3AA8B0
	for <lists+linux-leds@lfdr.de>; Tue, 07 Apr 2026 08:58:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9C0983006034
	for <lists+linux-leds@lfdr.de>; Tue,  7 Apr 2026 06:58:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5F2638F258;
	Tue,  7 Apr 2026 06:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WgOpbeWx"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835CE38C2D1;
	Tue,  7 Apr 2026 06:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775545090; cv=none; b=gWJZoYZH42iGohVqI6Hqm8tcGuStwrwUgKTIevo9pTpxXGzZ9BFjVtLADw4WYCgud8MYR/VIOreoOg5TrDQRhJo+Rn7ApeQ8+DGsziEDyPQnJZ4SiwTiIQBoLa4CyN5dg18VKPbZPPFPPZAuWbdY39nCw04tzQKouFvrfsl4rq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775545090; c=relaxed/simple;
	bh=Q1EVqiFzLQWhtx3CgXKnHJgnO4sfqApqXVHbkrxtwQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lKd9qCmIN90RWrkRR84Ovid4JNav0w49XjaVGvHds2/ddMkYK9W9t1Km4ugt6bTvES5NeHWWg6DPGof3uWCPBfYd030J7un40fvMnwDQV2ni1gV9FAOI1wDPtpzN/ASFhU/KRPlNVmqkzbb9L7+i2pbEpFMe8mnq6pXjU4v/q08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WgOpbeWx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C801C116C6;
	Tue,  7 Apr 2026 06:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775545090;
	bh=Q1EVqiFzLQWhtx3CgXKnHJgnO4sfqApqXVHbkrxtwQM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WgOpbeWxdAW5ztDLp8QxTv/ZMMwhz2q7Sqv1FmZqc9uGxWbZ4pnZOCC11hxtHiIeD
	 2O9IuscFQ736YUdf+UpjIkRC/aFo7CgjbEknmeW0xEDzGzAfrPeN6t3eOglUs/xQik
	 Zenaf6YL6rvVbkzoOH+5ATtbe7Pr/DYcsxvxMVkUqumVjo4WBDAZ2Qe7WEkaWX3RuS
	 J+xxPwE1qcWYrw+OX+ecBDTBTRCnf6XawOX4EgOdQZYmZ7AKQlZtUwEsAdA4Z+4zXI
	 vAc4rBMCmNQGPq2Jje7r16MHMNRLlN0CV9JMbzYWSWOAm8kqBIVHRY1kuOQOwTpLjP
	 932F8mQNV1G3A==
Date: Tue, 7 Apr 2026 08:58:07 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jan Carlo Roleda <jancarlo.roleda@analog.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/2] dt-bindings: leds: Document LTC3208 Multidisplay
 LED Driver
Message-ID: <20260407-outstanding-sceptical-giraffe-3fd6bb@quoll>
References: <20260406-upstream-ltc3208-v3-0-7f0b1d20ee7a@analog.com>
 <20260406-upstream-ltc3208-v3-2-7f0b1d20ee7a@analog.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260406-upstream-ltc3208-v3-2-7f0b1d20ee7a@analog.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7643-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.0:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-leds@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[1b:email,analog.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F23FD3AA8B0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 06, 2026 at 03:17:06PM +0800, Jan Carlo Roleda wrote:
> Add Documentation for LTC3208 Multidisplay LED Driver.
> 
> Signed-off-by: Jan Carlo Roleda <jancarlo.roleda@analog.com>
> ---

Still incorrect order.

...

> +
> +      led-controller@1b {
> +        compatible = "adi,ltc3208";
> +        reg = <0x1b>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        adi,disable-camhl-pin;
> +        adi,cfg-enrgbs-pin;
> +        adi,disable-rgb-aux4-dropout;
> +
> +        led@0 {
> +          reg = <0>;

I still expect this to be complete, so at least function and color.

Best regards,
Krzysztof


