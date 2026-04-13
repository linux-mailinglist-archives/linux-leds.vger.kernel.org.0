Return-Path: <linux-leds+bounces-7703-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGVoNFZ03WngeQkAu9opvQ
	(envelope-from <linux-leds+bounces-7703-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 14 Apr 2026 00:55:18 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 511433F41B9
	for <lists+linux-leds@lfdr.de>; Tue, 14 Apr 2026 00:55:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5587930B0759
	for <lists+linux-leds@lfdr.de>; Mon, 13 Apr 2026 22:51:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E11BA39B4A1;
	Mon, 13 Apr 2026 22:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FYRkarRl"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF5F313E15;
	Mon, 13 Apr 2026 22:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776120697; cv=none; b=lTH97whRPd6Z5qd+ubvTCq7pTbrTUAp4oxDEtzBu3hIWxCzunPoOgqlT8CLwrqP8sU6OCj8HQf1oz0lORxSeEiByV2nSdNzj6CfAFEyoxhDb6xLMuJPhjGfcQY6NjA1SyGP6KBsSo/vMV+ZYJmkKiUpv+4rlbof8WsLzAbJlWIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776120697; c=relaxed/simple;
	bh=0altFY3yuMLaI3GkEB2b56A4JNjc0pTnWlSCELaE9Jk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AEVz/agLITm6r9FN6TX64CJjT5KwGfQ6dtGldkfnOYIhktHFfAF/0bxi7kN6TSMTRlqPlMiA72nb71uaQNjmFUf86/Pb8L3Of7QohbLkUtSHwEAhVXR4SoyGnwInbMy+0tpupW5HURbIgmUf6IFfHnH6ZfoFXjptyHACns+TGsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FYRkarRl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01936C2BCAF;
	Mon, 13 Apr 2026 22:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776120697;
	bh=0altFY3yuMLaI3GkEB2b56A4JNjc0pTnWlSCELaE9Jk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=FYRkarRlmMHHU08vvrZDPoIyooBAYjHdmGfeuVs4t2D0NHFmxseVwb9Y2zo4SmLQd
	 VFVHaakxuCKg1KFXZd5uYwYbS2tWGsSt5Lwor4QvWUUd/3zHBp63ZcZtxjPw02frW3
	 kB3szv6oGLlNAbJXfUri7sAlpVhpd7MB8HmBC55ePlIgopEjzjw9YEbuCcKUsaqB7S
	 OngWCmqWSBkk2dgNDnjnL4537fG3zNMUpFDKUMGmJsCMujT9SfyEvPaSHYiLQJamof
	 ZGDYvZnz+/YBf7sR/2ZRxP3+AX5CUoxoePcA+30qKcKGCUK3BCfik0DQeHkWuVMx/Y
	 7X++S+xzB5tUw==
Date: Mon, 13 Apr 2026 15:51:34 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Carlo Szelinsky <github@szelinsky.de>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, Kory Maincent
 <kory.maincent@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S
 . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Krzysztof Kozlowski <krzk@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Rob
 Herring <robh@kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, kernel test robot
 <lkp@intel.com>
Subject: Re: [PATCH net-next v4 2/2] net: pse-pd: add LED trigger support
 via notification path
Message-ID: <20260413155134.00120417@kernel.org>
In-Reply-To: <20260410124428.809943-3-github@szelinsky.de>
References: <20260410124428.809943-1-github@szelinsky.de>
	<20260410124428.809943-3-github@szelinsky.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-7703-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,netdev,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 511433F41B9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 10 Apr 2026 14:44:28 +0200 Carlo Szelinsky wrote:
> @@ -266,6 +267,23 @@ struct pse_pi {
>  	int pw_allocated_mW;
>  };
>  
> +#if IS_ENABLED(CONFIG_LEDS_TRIGGERS)
> +/**
> + * struct pse_pi_led_triggers - LED trigger state for a PSE PI
> + *
> + * @delivering: LED trigger for power delivering state
> + * @enabled: LED trigger for admin enabled state
> + * @last_delivering: cached delivering state for change detection
> + * @last_enabled: cached enabled state for change detection
> + */
> +struct pse_pi_led_triggers {
> +	struct led_trigger delivering;
> +	struct led_trigger enabled;
> +	bool last_delivering;
> +	bool last_enabled;
> +};
> +#endif
> +
>  /**

avoid wrapping type definitions in ifdefs.
This only forces other code to also be wrapped in ifdefs.

