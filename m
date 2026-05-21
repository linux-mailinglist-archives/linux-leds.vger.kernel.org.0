Return-Path: <linux-leds+bounces-8275-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iOX6D8PODmq7CQYAu9opvQ
	(envelope-from <linux-leds+bounces-8275-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 21 May 2026 11:22:11 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B17D25A23AF
	for <lists+linux-leds@lfdr.de>; Thu, 21 May 2026 11:22:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DD73130815DB
	for <lists+linux-leds@lfdr.de>; Thu, 21 May 2026 09:05:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E4E634572F;
	Thu, 21 May 2026 09:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eKQomMCR"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D362882D6
	for <linux-leds@vger.kernel.org>; Thu, 21 May 2026 09:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779354267; cv=none; b=BTAmekB/n+dfuBc3D/2WmlG9cmbCRYAOMxBbKhqvaLBIAw0VXb1cqYjVdMUoh1hqLKF3ANLg7B2OqW36uaYsuGWzQH4I4AQccwvovQ5a3csyFoHgZGIVrdMpe9ny4jkIb3dtp5mkFjYsT/yRoS06Atc/Jfikfn5D6q1a25s3CcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779354267; c=relaxed/simple;
	bh=TKLGSf3GBjMP36BA0MEdaSC8c160hy43LOrQEKAZGHA=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tddhK3bGVxbR44l/TJ6fc2jTs7ThCWjE3+dYPUaKUY9eJ1LoLlZ8bTubjLfNl6XeZzFhSGa6SnLL1s+xFfVul0vVLa2K9RFF5QIOjXK+LTzMqpKB/etfDWk7MoU9BkGa4zQ1WVB+65MpQU2KDA8UMaz4x1UxzCxRIsQTOJOQr54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eKQomMCR; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F01EC1F01560
	for <linux-leds@vger.kernel.org>; Thu, 21 May 2026 09:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779354266;
	bh=TKLGSf3GBjMP36BA0MEdaSC8c160hy43LOrQEKAZGHA=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=eKQomMCRdagq0CrKNNAbWd+5SdT7HxEZk8SS5c8YukUkxYbmsHDNc/MTCkRogOOAR
	 Pt90hL1Y+9+RT+N3XxUqrqLtC8PCPudBhj3TVnarBl21Gv9NEoCrtJ8+d5Jb/WMAeC
	 ML0j7DPXCMlI6VpU6g8SKFHinb03aCauKOqSAnYd6mmg/ByxqHRUMCYHVZSLCbjYjR
	 Jqr3WTarjbmTW+joe5Y++iCVDIgMGOqSp9V1U1/HCam6x7pvdtNk1FCRJOo8Tkv7FQ
	 FOLySF45LYKr6CJSo7I6TQ3iC18Zx5azfFzHqJN/J5myRPJSuw9bweC9nSI3U1A2dq
	 WJy66QWmIaooQ==
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-135e88b8e55so6396938c88.0
        for <linux-leds@vger.kernel.org>; Thu, 21 May 2026 02:04:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9GpfoZYvVfzGaYpl6QjSsvMKUkr/Mk0eoxffwAMVFQpgB2+iOCb1Z8cPqZfzi3AKAn6qqNHNMgCeCx@vger.kernel.org
X-Gm-Message-State: AOJu0YwZMm0ctQZEVM8HX6Cq+ZYQOTEo8k9/zxyrHyjC9cbqzZ5vwRvY
	p+KFXxhkBUdsFshkYnM5z8SRvomlNsNB6iRWjV8/ld495y6PWpzJJuw5JoWIDQdAxDWKgFL7xUR
	69eMKkw2oBdtwkHYzsOvoZAkf0VOLPVrO9ab5bdpqLw==
X-Received: by 2002:a05:7022:ec88:b0:134:a731:e778 with SMTP id
 a92af1059eb24-13632f6adf6mr920006c88.39.1779354265385; Thu, 21 May 2026
 02:04:25 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 21 May 2026 02:04:21 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 21 May 2026 02:04:21 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260520183815.2510387-8-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260520183815.2510387-1-arnd@kernel.org> <20260520183815.2510387-8-arnd@kernel.org>
Date: Thu, 21 May 2026 02:04:21 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mebt+hpSBfpsnHh1+SKt9b1cRBNge5WSoRrsfX1BBFgtA@mail.gmail.com>
X-Gm-Features: AVHnY4LWqhGtTeBYvpB-D8gN85zif4ar2-h8NZZ1yCLGF3pH11futzwzVDKQXSE
Message-ID: <CAMRc=Mebt+hpSBfpsnHh1+SKt9b1cRBNge5WSoRrsfX1BBFgtA@mail.gmail.com>
Subject: Re: [PATCH 07/10] [v6 net-next] dt-bindings: net: add
 st,stlc4560/p54spi binding
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
	netdev@vger.kernel.org, Christian Lamparter <chunkeey@gmail.com>, 
	Conor Dooley <conor.dooley@microchip.com>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8275-lists,linux-leds=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[43];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,arndb.de,googlemail.com,sipsolutions.net,iki.fi,kemnade.info,baylibre.com,kernel.org,atomide.com,alpha.franken.de,physik.fu-berlin.de,redhat.com,alien8.de,linux.intel.com,zytor.com,gmail.com,broadcom.com,lunn.ch,davemloft.net,google.com,lists.infradead.org,microchip.com];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-leds];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B17D25A23AF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 20 May 2026 20:38:12 +0200, Arnd Bergmann <arnd@kernel.org> said:
> From: Arnd Bergmann <arnd@arndb.de>
>
> The SPI version of Prism54 was sold under a couple of different
> names and supported by the Linux p54spi driver, but there was
> never a DT binding for it.
>
> Document the four known names of this device and the properties
> that are sufficient for its use on the Nokia N8x0 tablet.
>
> As I don't have this hardware or documentation for it, this is
> purely based on existing usage in the driver.
>
> Link: https://lore.kernel.org/all/e8dc9acb-6f85-e0a9-a145-d101ca6da201@gmail.com/
> Acked-by: Christian Lamparter <chunkeey@gmail.com>
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

