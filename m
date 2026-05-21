Return-Path: <linux-leds+bounces-8274-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oBIxF7DODmq7CQYAu9opvQ
	(envelope-from <linux-leds+bounces-8274-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 21 May 2026 11:21:52 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2AD5A2392
	for <lists+linux-leds@lfdr.de>; Thu, 21 May 2026 11:21:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E7C60304544C
	for <lists+linux-leds@lfdr.de>; Thu, 21 May 2026 09:04:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C675A368D5C;
	Thu, 21 May 2026 09:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U8xfN/oS"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7B837268D
	for <linux-leds@vger.kernel.org>; Thu, 21 May 2026 09:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779354243; cv=none; b=DBXiZKLDgzf8oXCX21LG3JJRBgau6Uc3BClxyQVNec+MAfdJGAgRBKeop27z9V4evHVQPmklaKfz6ifcaM2/r30lnePwcs6TNcIK/SkCb/4qNuRRXey8d1+HkPwqREa4ErXd1cGlYTLALWVYU0pJnlYpmnKEz8jYCGn7Vx1DhYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779354243; c=relaxed/simple;
	bh=1QUNyf1+4GK6M6glNGqXfbJnZI6n5ng1QfS4YTKrhtM=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FUpwhsA2vddf57JzrcbEMoJGTT3C+x3sR/ENSG77nfvcqpPNq7r9of3cfeFbnzDtZnW58mu3njb4aLqEv9WryPXC1BbAZ0jTIz5tMvb7Vi+b7YVcyrP0CWarX7i2aDPINhrJ3d7/Znow2ND1XzIp0dQD8TitgT+T1Xbm2pxoIyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U8xfN/oS; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E9C51F01560
	for <linux-leds@vger.kernel.org>; Thu, 21 May 2026 09:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779354242;
	bh=1QUNyf1+4GK6M6glNGqXfbJnZI6n5ng1QfS4YTKrhtM=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=U8xfN/oSnaOrNF+gtWDgNNJlSLhiqu7Q8UxQP2IAYfVXR5xgxWdbaVBaAzXyExy6m
	 EiiCuk3G4CJ5/GOGGPGJAffJtx0E/wQuk3mK/TJjRlP9wLfMhSW/ggsqBOM9vvc0mJ
	 4Q1+ZDu628ro1LYmqb+ztqMz72QHaA6fsdJrfe6qFmosM69fBhVsvkmDbR6GCCjFzr
	 S0ofyit/qO0sxtHY0C1WlU4Xv1MWW0l23zwMhkHm/Ck0RnfSzGvkkrvPYsBRJCWr2a
	 tN8Uht5hGv+3XNy6Y6s8OZja4tXvLwfByMASdUpbVP+Jw8XM0i8ZHc31/tsMxNxSAP
	 tkWQifWvaOpFA==
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-13643f6d1a9so98619c88.0
        for <linux-leds@vger.kernel.org>; Thu, 21 May 2026 02:04:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+oBtTPNro2wB66+lppnjACwepF/Qgb0PltULeEjqQyV9rXckF9MnvCkMYP7/n0vdpTYVx31mhtn7P1@vger.kernel.org
X-Gm-Message-State: AOJu0YxWPdJRXg7CA+7VQCex7WMd6JhNgacEXR5LlAL1v49m++NNK2EN
	CYRLDDXWJf2WuZC/3YxvQtXTHU0+B47jrI8ht/+h0u1wqxAGY23UZdjCESS9G+xAdS9e4ZZhvhi
	tz4CTFo6zn9TY+YJiZQuCDPbAL9F4v0jrCqxW2xZj1g==
X-Received: by 2002:a05:7022:624:b0:134:7497:2153 with SMTP id
 a92af1059eb24-13632b19501mr1138896c88.20.1779354241319; Thu, 21 May 2026
 02:04:01 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 21 May 2026 02:03:57 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 21 May 2026 02:03:57 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260520183815.2510387-3-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260520183815.2510387-1-arnd@kernel.org> <20260520183815.2510387-3-arnd@kernel.org>
Date: Thu, 21 May 2026 02:03:57 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mf=JGOJUfs__HxxqTkiEk5NrkMX5J6RkO+=ybHUfWGShA@mail.gmail.com>
X-Gm-Features: AVHnY4Iwi65kxiAOYAXhfVUikEld9MZPsgLFlTgVHCPfkqhuImHkvGx_B84f6lE
Message-ID: <CAMRc=Mf=JGOJUfs__HxxqTkiEk5NrkMX5J6RkO+=ybHUfWGShA@mail.gmail.com>
Subject: Re: [PATCH 02/10] [v3] input: gpio-keys: make legacy gpiolib optional
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Christian Lamparter <chunkeey@googlemail.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Matti Vaittinen <mazziesaccount@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Jonas Gorski <jonas.gorski@gmail.com>, 
	Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linux-wireless@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
	netdev@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8274-lists,linux-leds=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[41];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,arndb.de,googlemail.com,sipsolutions.net,iki.fi,kemnade.info,baylibre.com,kernel.org,atomide.com,alpha.franken.de,physik.fu-berlin.de,redhat.com,alien8.de,linux.intel.com,zytor.com,gmail.com,broadcom.com,lunn.ch,davemloft.net,google.com,lists.infradead.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-leds];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EA2AD5A2392
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 20 May 2026 20:38:07 +0200, Arnd Bergmann <arnd@kernel.org> said:
> From: Arnd Bergmann <arnd@arndb.de>
>
> Most users of gpio-keys and gpio-keys-polled use modern gpiolib
> interfaces, but there are still number of ancient sh, arm32 and x86
> machines that have never been converted.
>
> Add an #ifdef block for the parts of the driver that are only used on
> those legacy machines.
>
> The two Rohm PMIC drivers use a gpio-keys device without an actual GPIO,
> passing an IRQ number instead. In order to keep this working both with
> and with CONFIG_GPIOLIB_LEGACY, change the gpio-keys driver to ignore
> the gpio number if an IRQ is passed.
>
> Link: https://lore.kernel.org/all/b3c94552-c104-42e3-be15-7e8362e8039e@gmail.com/
> Link: https://lore.kernel.org/all/afJXG4_rtaj3l2Dk@google.com/
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

