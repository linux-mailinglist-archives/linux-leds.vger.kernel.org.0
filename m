Return-Path: <linux-leds+bounces-8712-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 57FuM7OHOmq1/AcAu9opvQ
	(envelope-from <linux-leds+bounces-8712-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 23 Jun 2026 15:18:43 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2686B7672
	for <lists+linux-leds@lfdr.de>; Tue, 23 Jun 2026 15:18:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=riscstar-com.20251104.gappssmtp.com header.s=20251104 header.b=LRUJmFDC;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8712-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8712-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=riscstar.com (policy=none);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E877F308CAFF
	for <lists+linux-leds@lfdr.de>; Tue, 23 Jun 2026 13:18:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 067BC3254BD;
	Tue, 23 Jun 2026 13:18:04 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE5A24BBEE
	for <linux-leds@vger.kernel.org>; Tue, 23 Jun 2026 13:18:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782220683; cv=none; b=NkYxMopF5y2tmJDM+oTdhdeldY0klhe7LKaskjOuKFUdOLpW1cHGlihcxqBNknp6NpzbDXlbM0dXKdDSZbd9QJUpfv+lBhhh8SGEb8V0eEAyiTyDMOarRqJPgAVfqwq105P/NJUv6FvTZrHUkSMmQVIzAnAMtwhPiJYXGXQzqgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782220683; c=relaxed/simple;
	bh=QWksKsu3aFjbz0U7IDFysKky5YyDvWjjH+s0LaexQxM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MkUIuDynVazSk/GySspPzPts39vg9FoW1OVYXbgiWu3SsHbwfLQq5+pFijWFKNkwOVC4RFUPj6/F4lIZJ7dBQNDYQdonJReARTpAwTmS5OT5U6WNdWSL8oZBJ9f5t1iaLAZquQo5LGaciUmkIZz0G6SzLLiyql5o4VsRQNSvpLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=LRUJmFDC; arc=none smtp.client-ip=209.85.128.54
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4923139e940so32785515e9.3
        for <linux-leds@vger.kernel.org>; Tue, 23 Jun 2026 06:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1782220681; x=1782825481; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xQjsOKmDv4bAeAAg8kHxPjywYyxr88XeXI1w7+vf02M=;
        b=LRUJmFDCPthifYRMfZhYIydgCNTbxhaAg+fwOLgzNj8ZVf8RkBIVX6dwaigUKzLs++
         1QbcBRqkV6/V5rIROWULa/4il6+DXssu0ODMgHHxZMNf9qSxLPLDLdR0HqRcRyHijn5r
         HjbhBzlT7dxKEPFLAqxzPbrYk/9EFXZ9fmY4XAf4Jq4rBMV8TZxZkYhfvWc7i4tPFGqB
         E51EArs9o1X93L7IHgMYpK0iV3UJ7ynnwbt7fLycxsZAIXHHA3CP5rZijioxBkz39JGX
         xgeKE+PjZ6dNBp1W4rcM/smOx5In9Y8SlpocKbsM+D8vXUrZH9aYxKitHWQcCfhHvJ8b
         I+OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782220681; x=1782825481;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xQjsOKmDv4bAeAAg8kHxPjywYyxr88XeXI1w7+vf02M=;
        b=CCuCR7I1Hs1OzGSDApoU+TmVCCBM/pIj6D4C6s30y1T8wyz7puWyNWZZVEIw75y4rB
         RUf0XAkV3UdNuHFxSxou6In3FM7YWXG+ssdfTIzaFfayocSuyB29qdI9cOTAFIV5xhDY
         bxH7+jnus8dkcQxWOWcpwcfmGkwxkKYsSAc5ltm8GXlznm5wdJ1Azbu18aPM2lffkp+V
         Lchh2pIoeaZl7NjBOcKBHSJttNBbb4uCVCS/sR5FSNpIdt6COeSzLUr37fQmVrUccENC
         +oBXs6Rx8D+uEyI/wDVohEvFxpOFavjN8oo5HlkL8V5kszTmPbQU5jdbZvKXqUpnm+tn
         35cQ==
X-Forwarded-Encrypted: i=1; AFNElJ/6uFPv9vhHDRhoBX05bN7w5TBwhqHgqByXjoenphaZ6nJV0BmASlIBnY3ZJ+V035d5VhrS5dkJgrjz@vger.kernel.org
X-Gm-Message-State: AOJu0Yxcf5ZXzJcbv6avD5bh1QzkUE6Rb5TbWS+AeUA1lYcUPCEvufHP
	8URTQkkKN/j+pH7M9rASIQlwilTncqqrqgMlTUcqpNYOGbJsokcF9D3iDxy5hNDais8=
X-Gm-Gg: AfdE7ckBBUQF9cv941SMbGUixirzhmxE5fY+x0yRloKnMWkN6TxiHpCaPZtdwmWolei
	hf/mw6X0g05w8rPsPMulRvnpcIvcUXpqx8MkDkKdnaJjNxaTFxhgzZ7ybc4x/4F5N/FEDK3sZ6U
	QdPFzTIp6L8/MK6JzioE7/kdkcsdC+nIr1yKjVoMIkPc2vweVglr3J+OFkOYaM5LzHmkyZmGJ5n
	aquKJQUNGH+ms4x/Q8A+od8+3LypH8Zu2zwfn8I2YsgTt3QBt8Zo86W3oP71vOWqhDKAjCMOqzP
	NlMtWMei/EydcCDWtVuBfdtqNNnIOvSbVVAlJogI5jJ12nwiBGpDSUJxeueai9r0pJPrziXfsDT
	Qto2icERRSCdGxeKlImQO/t77Szl8c7vo+A9Qac4b8M1aN7pjMim0soZZOkpolcyI5+3W0wMHh3
	kVBcYMfjcM1fwz5kLC23f+nmRwBtXRRRL8y1G5fRPLzWYfK2TQG/VD79LUJe8eqoAa3qKLWp9lm
	f/iNS6s8c/XkaOY5JJBOwQgjkQZghmJ3JCcGReNekEZUueWzc0AvmMzWSHg41qH+j6JyCzA9Q==
X-Received: by 2002:a05:600c:1548:b0:492:39b6:5a30 with SMTP id 5b1f17b1804b1-4925b38f01bmr37906055e9.35.1782220676494;
        Tue, 23 Jun 2026 06:17:56 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-466648c5de7sm35009927f8f.15.2026.06.23.06.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 06:17:55 -0700 (PDT)
Date: Tue, 23 Jun 2026 14:17:54 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"danielt@kernel.org" <danielt@kernel.org>,
	"linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] backlight: lp8864: Convert from LED to backlight
 class driver
Message-ID: <ajqHgqKsh4CpMm1I@aspen.lan>
References: <20260615120353.3409035-1-alexander.sverdlin@siemens.com>
 <20260615120353.3409035-4-alexander.sverdlin@siemens.com>
 <0b39450b-559b-43d4-a1e9-bb6684691cb5@ti.com>
 <acb13aca040ab72b9e53abee3a5c8733ebc5b8dd.camel@siemens.com>
 <ajpw1w150SXm8Gbi@aspen.lan>
 <aa34231591d2e5f848bdd74524abb4fe85123444.camel@siemens.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa34231591d2e5f848bdd74524abb4fe85123444.camel@siemens.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.56 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8712-lists,linux-leds=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:alexander.sverdlin@siemens.com,m:dri-devel@lists.freedesktop.org,m:danielt@kernel.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-fbdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[daniel@riscstar.com,linux-leds@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:+];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@riscstar.com,linux-leds@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aspen.lan:mid,riscstar-com.20251104.gappssmtp.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,riscstar.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2B2686B7672

On Tue, Jun 23, 2026 at 11:59:16AM +0000, Sverdlin, Alexander wrote:
> Hi Daniel,
> 
> On Tue, 2026-06-23 at 12:41 +0100, Daniel Thompson wrote:
> > > The mechanism we have regarding hot plugging currently is just I2C bridge,
> > > which de-registers and registers the bridged bus. So no additional drivers
> > > are required, as long as I2C devices are self-contained and not glued with
> > > platform devices.
> > > 
> > > So bottom line is, I'd prefer to just add the backlight interface to the
> > > existing driver, no matter where it would live in the future.
> > 
> > Is there any reasion that LP8864/LP8866 is unique in appearing on a 
> > hotplugged I2C bus? In other words if support for dynamism is added
> > specifically to leds-lp8864.c rather than in led_bl.c then what will stop
> > the same dynamic tricks from being adde to other LED drivers?
> 
> LP8864 is not special in this regard, not different from adp8860_bl.c,
> adp8870_bl.c or lm3639_bl.c, which would work in my application.

The most recent of these drivers adopted LED support in 2012 whilst
led_bl.c was introduced in 2020.


> So I just wanted to add currently missing backlight_device_register() to
> LP8864, but there were no such dual-API drivers under drivers/leds/ that's
> wht I started with moving LP8864 driver into drivers/video/backlight/.
> 
> led_bl.c however could only be hot-pluggable either if one actively
> creates/destroys platform device somewhere in the code programmatically
> or uses DT overlays.
> 
> Just adding backlight API to LP8864 would be much more idiomatic, I'd
> say.

Maybe.

I think I might consider the drivers above to be historical anomalies
rather than idiomatic examples.


Daniel.



