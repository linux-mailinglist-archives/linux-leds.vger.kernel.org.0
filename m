Return-Path: <linux-leds+bounces-7514-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cDxQA/f4xGmC5QQAu9opvQ
	(envelope-from <linux-leds+bounces-7514-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 26 Mar 2026 10:14:31 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B68332109
	for <lists+linux-leds@lfdr.de>; Thu, 26 Mar 2026 10:14:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5889F3010B58
	for <lists+linux-leds@lfdr.de>; Thu, 26 Mar 2026 09:14:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21BB83B8D7F;
	Thu, 26 Mar 2026 09:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WtGvdbQp"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F302635CB6F;
	Thu, 26 Mar 2026 09:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774516446; cv=none; b=fG1Dm7xXDcoS0CQgezyEQXHdhEx1G+Yt84sPS6BvvBK65wcNmraLdLbPshnHc3EMTxr0P6WzVeVF25jrXRWq+CcpYHHMpYpPBKEpYtKHoab1n9iTHWGJ/tA8cAZsHTo+SKOWQrRSq4PXtQyK+2J1pmB+C6TLoB+589MS7wtCPrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774516446; c=relaxed/simple;
	bh=ICaDmlVlOI2ON2amlvJM5Q0rinkuBd/FinCz7z5Cpjg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UiHKty75/Xi2VDf8CunYPX8VkFMyzeKSL3AoOwLFxanTCkg2vVOKeifq3PG450NX9ZWTA1g6vVk1/FfI5AjYPUjHjICFV6ouGejxCgpnoleIhRcm3f8V0dVaRMNLzgfgMhFsDG+bFQFAL8fCknhk08xcYxvwZ8gukuBO7dw+qFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WtGvdbQp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF4B5C116C6;
	Thu, 26 Mar 2026 09:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774516445;
	bh=ICaDmlVlOI2ON2amlvJM5Q0rinkuBd/FinCz7z5Cpjg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WtGvdbQpkp6A5ySYuD2JKSBTnt8Kkr0XYGaDv+i9SVnBY3QjhUmn7AuCiKAMboyw2
	 sWX9hT0BQiyYl6d4iCDTeHOH02JyNTpfU0WzHCzVyLjez3NgQq7k2HQWpsgRGv+u4J
	 qu7x0u7y1Kw8uFLwVAFWdKBBqwBQc75l8ewPglYgBoWXxFhYjWM7JkRjH28RuFkMY1
	 4O6rjLx47Pdylg5Qgqn2Rf3n55UYNQNgrJnEIRGzMilQS6B3q8dOMPFu9CXCUrrH6e
	 NjuRBJIjM4HV3ltRFlqQUL8AGXqZJtfr5zU36MMM6CdIRB+tND5bEksEoLrh6/PNN5
	 IG43ArDvUYXFQ==
Date: Thu, 26 Mar 2026 10:14:03 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jan Carlo Roleda <jancarlo.roleda@analog.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/3] Add Maintainers to LTC3208 LED Driver
Message-ID: <20260326-analytic-singing-panther-ebffe5@quoll>
References: <20260326-upstream-ltc3208-v2-0-3dbc992b6098@analog.com>
 <20260326-upstream-ltc3208-v2-1-3dbc992b6098@analog.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260326-upstream-ltc3208-v2-1-3dbc992b6098@analog.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7514-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,analog.com:email,analog.com:url]
X-Rspamd-Queue-Id: C3B68332109
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 06:30:10AM +0800, Jan Carlo Roleda wrote:
> Adds maintainer reference for the LTC3208 LED Driver.
> 
> Signed-off-by: Jan Carlo Roleda <jancarlo.roleda@analog.com>
> ---
>  MAINTAINERS | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 55af015174a5..3f3331d7272a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15126,6 +15126,12 @@ W:	https://ez.analog.com/linux-software-drivers
>  F:	Documentation/devicetree/bindings/iio/temperature/adi,ltc2983.yaml
>  F:	drivers/iio/temperature/ltc2983.c
>  
> +LTC3208 LED DRIVER
> +M:	Jan Carlo Roleda <jancarlo.roleda@analog.com>
> +L:	linux-leds@vger.kernel.org
> +S:	Maintained
> +W:	https://ez.analog.com/linux-software-drivers

This is pointless change. You do not maintain here anything. Apply this
patch alone and see - does it have any effect?

Squash it with the next patch.

Best regards,
Krzysztof


