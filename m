Return-Path: <linux-leds+bounces-9055-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tbhACz0SVGq2hgMAu9opvQ
	(envelope-from <linux-leds+bounces-9055-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jul 2026 00:16:29 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C457461F3
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jul 2026 00:16:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=apefZ22M;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-9055-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-9055-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2EDAB300147A
	for <lists+linux-leds@lfdr.de>; Sun, 12 Jul 2026 22:16:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BCFE2EA754;
	Sun, 12 Jul 2026 22:16:26 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA162417D9
	for <linux-leds@vger.kernel.org>; Sun, 12 Jul 2026 22:16:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783894586; cv=none; b=YEmdk0vMYGMQI+szOcjK1TDDaKCeRuwRBnvGnRuRb2kbmK2S+Hu5SJc18TOpxMsZglsOhZUIamM3afOnSfRQOInDUlGX6Dak7nK1PqBgjNlh9Pm3xUjHK5aC4hnX/B2jcDcPy0tcslxA8SOrv29Q9blaZeR3ipTuQhdzHC9eeC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783894586; c=relaxed/simple;
	bh=xjQhMzCbcE/Hi6RQV0p4Aml/qju1nJoCTa+HYVyF/Bk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J7gNRSeVolx+/heCx887Y9vEJ/xUOvAAo3SoS75PfT7UcS8LTQ9Chfj/v1zaSUogQoMiAHkGdQSpM3DHtcmf6s/pZDhnV3D6xOJRHkNZQv41METKrs6zfHAiAhbgPd5BGk2A7N817ZGHp8r5NGNV4YTw1FfMHtYs+LU7OktyU0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=apefZ22M; arc=none smtp.client-ip=209.85.128.43
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-493e8d4f4dcso19557255e9.0
        for <linux-leds@vger.kernel.org>; Sun, 12 Jul 2026 15:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783894582; x=1784499382; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xjQhMzCbcE/Hi6RQV0p4Aml/qju1nJoCTa+HYVyF/Bk=;
        b=apefZ22MS7GluiXu8FQPfGaRqdF7VKwM/FLj6OZktW6Kp9NlR8PoeOO5viZr/FzJ61
         fny/kWnVJ8FGSEsaUbziP4A4ZdYlv1DL2v5+PaWGnIVQoPTDgtmgXOJcnCdEYu+rbQCC
         5rYskuxg+TgorQbwbjRW2DDBAjscafwceUxcZAPNZVijGwkGAO7b60+/TVssZQvDlQy2
         g5NATtEfcPk+STIg6Wpo1ZxIB6C3K6QNyjSyWgaZ3kxQQG0pn2CCeUsQ4KwZXVV1FRUD
         yvgFxyQrv4044cx5OKkZRobN04ZCflLdCIks+k4pbp7754nXJVnl3olaWjou4RJMoZZd
         dR7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783894582; x=1784499382;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xjQhMzCbcE/Hi6RQV0p4Aml/qju1nJoCTa+HYVyF/Bk=;
        b=ln1oO61Cvfi5xaiRaBmDq76xQfIMg4uDVoAZHsknZQqwif/82OAAAJmICMLdRjIlna
         1X34cYqdw7ATiIuwSnEUGgDcIGxKFjJipSql6cWmE2q2P/40sZWrjIFeATu/3EH6T/6Z
         s5XISvlWJc57lh/Mqr+jfqfn6v5XgZehZzdinfva4i0Y5djPIG/ipmw2OKnNqumHyI9d
         rq0tYp8F1wpfbb7jD/0r/p4ATkzF6Boqc5rFHMBqS8GyzExlL4D8tcuDMAAAjylONgwL
         7Q6amY+kMo40HOBbKu3iVy9hnwZJbGZtkORroP5vvO8HzUfVFjyF0UylK8A0yB8Foym6
         N3Rw==
X-Gm-Message-State: AOJu0YyUCn8H+yiFVXmXyKYIUEaLdEzlsStP/IrV/ZMvnXu5eobub0FF
	n2PMT93LlDddMLpVGDM6dbZVg8RJ689zkSSzNZysQ8T8cH4kadfHY13f2qIWh3ht00MtBzu+6jU
	TlECe
X-Gm-Gg: AfdE7ckGHrMvLixPfnaXMvQ2BWzg+IgWFriWl5dLWDYAAUfE4nkPTKjK9iM/zo79bFH
	z9R3a6RLKcoQrP19Vt+s4XTud6FWsMkH+JIii24bQgMdHlH4gC9t16UaLiu258O3hi53+dBrEk5
	trRyCnFIPnU9Of2aXmhOxsp5IysJlw8bmk2/z510JLHrdDD0Wt8/uIVjbbn8vD679s+1R2jV+PT
	3yv08LApx+iTyQDDpvMH1XjyLn29E5Yu814cFrPLGzfF9YxWHwxgKwvYt/YguEP4dU6C/hRB5Jk
	sk5cVOIhUPAZ2AfukwTRR6VDZTY9K1AjlGDdu8ml9/uck+D2iYREpxDdSt+8cfo44+YSsvjz+ZM
	WZPfhlgQhWyjuG5cKDlu/P9S7OpU91Nl2zIKnkRx1JR+WjQTsGKn4lzHK0LT4vElv9mLjXwd3pf
	WxkCfmcXv8olj2s416eQ==
X-Received: by 2002:a05:600c:1394:b0:493:bb45:d54d with SMTP id 5b1f17b1804b1-493f883c8f2mr62174225e9.37.1783894582332;
        Sun, 12 Jul 2026 15:16:22 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493eb6ea082sm340884155e9.11.2026.07.12.15.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 15:16:21 -0700 (PDT)
Date: Mon, 13 Jul 2026 00:16:20 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Alistair Bell <dev@alistairbell.org>
Cc: linux-leds@vger.kernel.org, lee@kernel.org, pavel@kernel.org
Subject: Re: [PATCH 1/2] leds: Texas Instruments LP5816 driver
Message-ID: <alQSAYiSGnis0Wl6@monoceros>
References: <20260712184318.78852-1-dev@alistairbell.org>
 <20260712184318.78852-2-dev@alistairbell.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fbneh3rmvwaynszu"
Content-Disposition: inline
In-Reply-To: <20260712184318.78852-2-dev@alistairbell.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dev@alistairbell.org,m:linux-leds@vger.kernel.org,m:lee@kernel.org,m:pavel@kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TAGGED_FROM(0.00)[bounces-9055-lists,linux-leds=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,linux-leds@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[baylibre.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,baylibre.com:from_mime,baylibre.com:dkim,monoceros:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B4C457461F3


--fbneh3rmvwaynszu
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 1/2] leds: Texas Instruments LP5816 driver
MIME-Version: 1.0

Hello Alistair,

On Sun, Jul 12, 2026 at 07:43:17PM +0100, Alistair Bell wrote:
> +#include <linux/mod_devicetable.h>

Please don't add new users for this header file. Only use those
<linux/device-id/*.h> that you actually need (if any).

Thanks
Uwe

--fbneh3rmvwaynszu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpUEjEACgkQj4D7WH0S
/k4p9QgAghowlnq1fs/cvRNnQBPuIPYyLqCatQ9uOOZRcm14MNWc7uf5nB76Phqj
cWhdr7OrD708pZ7CorDyWmigKOmIAJ533IMT0cmKpfQTwTZQWxfAJNioOGIijCVt
+ba0YVFkaQ1lYhJY8JeAhkCP/nMAqxc5/c+KZ+oDtBzg3h6tTAGGYGqlhymqidvb
s4OSc/Rj19OrYq1qzYhjLFb24kMyRnhK/PfWoZHatQczdghFrQteodnamvpAnX3K
1jDkHl7P/idn/sIZ/C1GfnrouYC7Hb8t66YGHmqdoE8OCEBs9eosmTc+74ZdaULk
5DATAAgXdjbDH2OBtVBUSkc9NTC57Q==
=EGfB
-----END PGP SIGNATURE-----

--fbneh3rmvwaynszu--

