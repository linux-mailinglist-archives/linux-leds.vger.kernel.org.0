Return-Path: <linux-leds+bounces-7477-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SL8uC/nqw2kAvAQAu9opvQ
	(envelope-from <linux-leds+bounces-7477-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 25 Mar 2026 15:02:33 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A3FBF326581
	for <lists+linux-leds@lfdr.de>; Wed, 25 Mar 2026 15:02:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BFA1831B998B
	for <lists+linux-leds@lfdr.de>; Wed, 25 Mar 2026 13:38:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80C39257844;
	Wed, 25 Mar 2026 13:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LW6lSWKX"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992EF2609E3;
	Wed, 25 Mar 2026 13:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774445920; cv=none; b=VRekzjr3GEPaQzoaiaHVaHk+i2Ny76nZSaGnniUa+OEritECEtAWiZR9fEipagH0Xq8wgPABe2yrfz4BRoWz3xCXH1J7o+0tPAs+ymf4GooLWhwGjxeseO2A+d0a6z4kC/c6y4PB4rLIItOH114IbjzUR4WAVs9NSG982pBuXoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774445920; c=relaxed/simple;
	bh=qxWrdAmfeUeLHOzPUJPDa2LECeKQYhDSm/W6aT8Tu6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ntoPxAh8MvwcNyiNsFsrGKRODDUMLXnt05aFxP/jTTGeZ+8/aC+2M3LcqI0Kqp7SL/hYsaONDFXOjwJW2Lt9j2Wdmw8l50OSWnh+7p5iOH0MeKHF/06BHibeLlDhKABX7eoI1NVm3iG3HmQgNmCsIR75CkZVzCLN9j2ZWQLY4+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LW6lSWKX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFDF1C4CEF7;
	Wed, 25 Mar 2026 13:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774445919;
	bh=qxWrdAmfeUeLHOzPUJPDa2LECeKQYhDSm/W6aT8Tu6Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LW6lSWKXA5yEDLQE8y3Kur1rm5uX7rooSNpvyqQWrGE/sqdMNRKAJn11H6EYn/gtN
	 vFp3IkFmxa4Fsmywt5JLVwxKSKzOdbHdpkuNRoYOo4989CIp0h6eF3ViPZgbJzyRpL
	 gD1BqQzlcVb7B0gCMsut72u0CezHEnpFqeuaFGhYUcPhwgric+CP6xG0VKcBS+7A2r
	 hzKwEO/w2jtAJzEEGv/Rm8if5QrOcXZgmpOjvfiLwOhUet207hV9E38XR/LaWTMlNg
	 qFma452tg3RxUgGArz1Rwa6UxdLD2czp+TA8Bb5NkeQdvkcY0hsN/tOh51U6Rz+ZL/
	 qsTn3VtEeOLCQ==
Date: Wed, 25 Mar 2026 13:38:36 +0000
From: Lee Jones <lee@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Pavel Machek <pavel@kernel.org>, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Fall back to using software node name as LED name
Message-ID: <20260325133836.GB1141718@google.com>
References: <20260311-led-swnode-name-v1-0-798a49e041c6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260311-led-swnode-name-v1-0-798a49e041c6@gmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7477-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-leds];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A3FBF326581
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 11 Mar 2026, Dmitry Torokhov wrote:

> This allows setting just name in software node representing an LED
> instance and forego "label" or other properties needed to form a name.
> This is helpful when converting old boards using bespoke platform data
> to software nodes/static device properties.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
> Dmitry Torokhov (2):
>       leds: core: implement fallback to software node name for LED names
>       leds: core: fix formatting issues
> 
>  drivers/leds/led-core.c | 20 +++++++++++---------
>  1 file changed, 11 insertions(+), 9 deletions(-)
> ---
> base-commit: 7109a2155340cc7b21f27e832ece6df03592f2e8
> change-id: 20260311-led-swnode-name-6db2e5757071

I'm happy with the set, but it failed to apply to leds-next.

diff a/drivers/leds/led-core.c b/drivers/leds/led-core.c        (rejected hunks)
@@ -584,8 +582,9 @@ int led_compose_name(struct device *dev, struct led_init_data *init_data,
        } else if (is_software_node(fwnode)) {
                n = snprintf(led_classdev_name, LED_MAX_NAME_SIZE, "%s",
                             fwnode_get_name(fwnode));
-       } else
+       } else {
                return -EINVAL;
+       }
 
        if (n >= LED_MAX_NAME_SIZE)
                return -E2BIG;

Please rebase and [RESEND].

-- 
Lee Jones [李琼斯]

