Return-Path: <linux-leds+bounces-7439-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKeQEuuXwWkuUAQAu9opvQ
	(envelope-from <linux-leds+bounces-7439-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 20:43:39 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E7F2FC83D
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 20:43:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2513730439F4
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 19:42:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3AC83D565E;
	Mon, 23 Mar 2026 19:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mpuq/cLd"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872833A961B
	for <linux-leds@vger.kernel.org>; Mon, 23 Mar 2026 19:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774294925; cv=none; b=Y0VXOwNNL1rVjv7t0wuylgIsSyWXak4ENOg7e0ISdFZI1GbW17YtTfdn0KvODFXPeBfL5BW4ysfJav0HQMq8mV2R4R1RKfrHzK7tvNzcq3Dt1dayOwyEArsiCS5I/9wiGh3dGAgsoWBwbvP8c3eBE8R3sxhQgl7QjWeqIwlPCaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774294925; c=relaxed/simple;
	bh=2SF6pvs2emzV/AhRbggyg1HdfzHcesbv4DvPDEr78n0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SqVCZ3c156QBOSEonxgRQ/RgNK31aD5lIgQiMVlo6FNqxOUCfDRLqKrahjFZDM7tEo/+0I6AenR1XuLxC7DPNcQyQtzepDQSc4o7Wbof8v/udJYMJ1CnaF9lOkbwWHr2TGuttVFVx0mekSe3JdIWBUIYVz1RXrlPspZ7xdroG9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mpuq/cLd; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1273349c56bso4329966c88.0
        for <linux-leds@vger.kernel.org>; Mon, 23 Mar 2026 12:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774294924; x=1774899724; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YdMs/q66h1+QBJjH+XkkqQHaHRaGP3OKtdQi49odTsU=;
        b=mpuq/cLda6pGx/tUb9lDgqEk1TmEAKbObTl2RQBeIQ7TfcopAZW6vT0jewqombymsa
         ffggOe2XuFf6d+ef7o4qVGt+fx4IpCgBt2qkMgJOQCi+uczeYEF6rIesjdsKrEL3M5VN
         CcYRglXwvZNqQZHopCW8GXfwLre3jBZ2qBrCP9NxR6MVZ0e4KhdAyK5d8fGJ+PYRrg10
         D9RJFirOLY1Wh595juUGg0DnPynppjDk3nEcSuWQ+SN++zEEZoNuzRhxsDEAn9cMWXlJ
         k5oSqN6udr9CgxHTJycW3gT0+cJeHTNiRaTAEiYb/tLjm2z6ObcvoWtWz1zkHGgHDNEl
         zSxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774294924; x=1774899724;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YdMs/q66h1+QBJjH+XkkqQHaHRaGP3OKtdQi49odTsU=;
        b=hRyduTftsxjuWEPjPo/OOFw1oVk0cvzOOkDc+yRkZ1I0WNEyC3BeslpR75r5ROIOEB
         gbwHrKWTS6xusQEsrINCLoat9bDi/nTRt4rym+3ju9wpFdQXaX/q6cQ/yOF/OkrAzHQC
         Zl9xcedCHslnSiDfnrKskD9pT/4WPiCNEcUqOTx2ORZiU2mmpB+Itk3K8wnxWsHjXphK
         sl1sAZNQEo7S2XXIcZlIIfAagTsTD3BJh4X1H02NRITKSGZ775xW24UERY22jh2g4fH8
         RSfDoeRW4ENfFh+rlJIJQhdo86sibjRyo/t0fJ/uo2jg2l/IIkUO2yrcQn2rtFMnSnoR
         pDOA==
X-Forwarded-Encrypted: i=1; AJvYcCXaxuBtCdo9FkAqPjbEE3KWEETUkQYyxiDmPYfJBN+28Y2N7n7SmdkFOV8LadK12Os2kdmwYV68SheV@vger.kernel.org
X-Gm-Message-State: AOJu0YybhFgA7aTsJbSy/vH0V7cMJtDr58JmLxdJ9VdL+1uYkVhEhGOA
	4D6yvk+aw0aa/JblWgVfaUrhF6+KoI+oZYj5jqn0OiS1GBUvCDBkWI4T
X-Gm-Gg: ATEYQzzAT2G4oD+9A4x6NhtWliWNvkXiH3hmPPS7g8pA9X477o9YLC3U6Ah4nTFCz3Q
	nCcuQruSzNfRtE6dahzgG9OMi5VASOcjlhddr/F15GB/2GUW70sBk4FqdPBQEuHQD9fTFds1+BO
	U4dVe6AliKzFZf0UE/I5kOXwQVdFzKY87oXmXWYfBfWneGS2rW7JiYRU/51I3om8J2uLZ0G2yE9
	pqdY8IRziRWMLTarBrHmnCfmUm6myVYK59daRLrG7K570pz+KXi+xOS3RhhsbA7aM6sRFxqXE2+
	Mqcq8gohZSPpNJwlxO3UbPSWJecUeberrbw88efcBj8qszfpu9DPvm8gIw9fuPa/1wSWVpEtxAW
	z3YPNVfeh9NqtoJ4sO+ae/KTn9rq9f2imKGdHVJ/6zBkhTZsH476f7tBFuehl9wHiFkpWcm9gGX
	BN/qYQji29ruuVwnMRSfB1R6mR5cAkGG8XucppbnpjAq1+427enDWwOHk6uuakV5yb
X-Received: by 2002:a05:7022:6713:b0:128:d1c9:3633 with SMTP id a92af1059eb24-12a7265f60dmr5533874c88.13.1774294923678;
        Mon, 23 Mar 2026 12:42:03 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:a296:1211:5ab0:bc95])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b17b8f2sm18088976eec.9.2026.03.23.12.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 12:42:03 -0700 (PDT)
Date: Mon, 23 Mar 2026 12:41:59 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Peter Rosin <peda@axentia.se>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Moritz Fischer <mdf@kernel.org>, Xu Yilun <yilun.xu@intel.com>, Tom Rix <trix@redhat.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-spi@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-fpga@vger.kernel.org, driver-core@lists.linux.dev
Subject: Re: [PATCH 04/10] regulator: of: switch to using
 class_find_device_by_fwnode()
Message-ID: <acGWJf1AGXT1xduM@google.com>
References: <20260322-remove-device-find-by-of-node-v1-0-b72eb22a1215@gmail.com>
 <20260322-remove-device-find-by-of-node-v1-4-b72eb22a1215@gmail.com>
 <360a8b4a-6507-417a-9fc1-c53b14868657@sirena.org.uk>
 <acGFksyx3SA0kJ5b@google.com>
 <7d46803e-b285-4e9c-8856-10100fa0ea85@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7d46803e-b285-4e9c-8856-10100fa0ea85@sirena.org.uk>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7439-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,linaro.org,gmail.com,axentia.se,armlinux.org.uk,intel.com,linuxfoundation.org,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[28];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,netdev];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 00E7F2FC83D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 07:05:13PM +0000, Mark Brown wrote:
> On Mon, Mar 23, 2026 at 11:28:27AM -0700, Dmitry Torokhov wrote:
> > On Mon, Mar 23, 2026 at 02:00:43PM +0000, Mark Brown wrote:
> 
> > > The regulator API is very deliberately specifically using the OF APIs,
> > > not the ACPI APIs, since ACPI really doesn't want to model regulators.
> 
> > For now? We also have software nodes and maybe we come up with something
> > else in the future...
> 
> > I think we should use firmware-agnostic APIs as much as possible, and
> > only use OF- or ACPI-specific ones when there is no generic equivalent.
> > This makes the code most flexible.
> 
> I think this is a worrying idea for core code like this, we have
> specific firmware bindings for specific firmware interfaces with the
> different interfaces having very different ideas of how things should be
> modelled.  The chances that firmware agnostic code is going to do the
> right thing seem low, and encouraging the use of generic APIs that might
> happen to run OK raises the risk that we'll get firmware vendors relying
> on them and leaving us with a conceptual mishmash to sort through.
> 
> Software nodes are already a bit of a concern here TBH.

Firmware vendors can introduce incompatible DT bindings and have them in
their devices too and we have to deal with that... 

I think if this pushes closer ACPI and OF schemas for at least some
subsystems closer to each other it would not be a bad thing.

Thanks.

-- 
Dmitry

