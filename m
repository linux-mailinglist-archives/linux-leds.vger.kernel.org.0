Return-Path: <linux-leds+bounces-8113-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8B76BT/NBmrynwIAu9opvQ
	(envelope-from <linux-leds+bounces-8113-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 15 May 2026 09:37:35 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C5354AAD4
	for <lists+linux-leds@lfdr.de>; Fri, 15 May 2026 09:37:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3E6F43004F19
	for <lists+linux-leds@lfdr.de>; Fri, 15 May 2026 07:37:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 698E43E9F8E;
	Fri, 15 May 2026 07:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IvCFukU+"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F7B3E3173;
	Fri, 15 May 2026 07:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778830647; cv=none; b=O/FdPtWIcDWtnQwfBojhtR72t4CWK1oJI1uBgcrS/OutGRfph6LIItqIxJ6l1ZHxtF0G/lM2fISYpTZCzQnxchGvcm7yGf+5EDcL1ZNdcWWDxh6R++aesq4rx2j5TLHMG8pvK/jC+sI4e4m+wGtt85CaZELCw+9AQ019rnba7ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778830647; c=relaxed/simple;
	bh=a8EYgOEz++YwUaCdJC5iuFQH3G+D7Z3AA/LV/KjouHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VQ8KaKEfPqxJZ8s2ApaE7UvLEGWcfsCyWUgSgPLDhENVgwaz0nsKR6CdyaXNuBa625gf9JOZKoETXWiMpCIYzWcvBKGB6x0acsuWjh7uIN8bdD0zyBsSMeT8h8w61pkdpLswK0Z0PORI1m0MMITijACtMdkCD1Lc2sBBTWwffBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IvCFukU+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64A80C2BCB8;
	Fri, 15 May 2026 07:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778830646;
	bh=a8EYgOEz++YwUaCdJC5iuFQH3G+D7Z3AA/LV/KjouHQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IvCFukU+krehMgs77r1eo1DOe8p6PhMicmvj3a2hns+H7LMtIip+pPzY/sklR7o2s
	 +KB9LebJmj3GJJxDcscEY9TQo4ZA3NyhuNHhpEaao1szG3L7D+LLMtE68Vf/3L1iGP
	 AuVAqPf30D73I4Gc/fV5p6yFZjkaG5xcjLcak61mclalI4bs6SKAV5bmsHZnUmqOXW
	 wCFVoYZdMJFkXOSjZsu/7e1DUBgHZuX9dvGvmqR+SK/EurDnrwD8tQkAw9Pd/uQfXR
	 ciPYKQCiRuPbWNHrzvSo8bhagrEr91UH5eS4marGBbBkpilrSMWE8jqr+eOGKG4KSg
	 EXd+BEohmQXKw==
Date: Fri, 15 May 2026 09:37:24 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexandre Hamamdjian <azkali.limited@gmail.com>
Cc: Philippe Simons <simons.philippe@gmail.com>, 
	Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>, 
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: leds: backlight: add Silergy SY7758
Message-ID: <20260515-friendly-anaconda-of-dew-abd4dd@quoll>
References: <20260511-sy7758-v1-0-999a33081304@gmail.com>
 <20260511-sy7758-v1-1-999a33081304@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260511-sy7758-v1-1-999a33081304@gmail.com>
X-Rspamd-Queue-Id: C9C5354AAD4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8113-lists,linux-leds=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-leds@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,gmx.de,lists.freedesktop.org,vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Mon, May 11, 2026 at 12:08:02AM +0700, Alexandre Hamamdjian wrote:
> The Silergy SY7758 is an I2C-controlled multi-channel LED backlight
> driver typically used to drive the edge-lit LED strings of LCD panels
> in handheld and embedded devices. Brightness is programmed as a 12-bit
> linear value through two 8-bit registers.
> 
> Document the binding for the new compatible "silergy,sy7758" so it can
> be referenced by board device trees and the matching driver, and add a
> MAINTAINERS entry covering both the binding and the upcoming driver.
> 
> Co-developed-by: Philippe Simons <simons.philippe@gmail.com>
> Signed-off-by: Philippe Simons <simons.philippe@gmail.com>
> Signed-off-by: Alexandre Hamamdjian <azkali.limited@gmail.com>
> ---
>  .../bindings/leds/backlight/silergy,sy7758.yaml    | 47 ++++++++++++++++++++++

This was already sent two weeks ago:
<20260430-topic-sm8650-ayaneo-pocket-s2-sy7758-v2-1-308140640de9@linaro.org>
and that posting looks closer to complete.

Best regards,
Krzysztof


