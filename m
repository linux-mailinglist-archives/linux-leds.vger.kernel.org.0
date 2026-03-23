Return-Path: <linux-leds+bounces-7458-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MF22DJLDwWkHWQQAu9opvQ
	(envelope-from <linux-leds+bounces-7458-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 23:49:54 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A21432FE853
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 23:49:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 530FF3030EC7
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 22:48:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87D573822AB;
	Mon, 23 Mar 2026 22:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sSJqU6De"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A57383C98
	for <linux-leds@vger.kernel.org>; Mon, 23 Mar 2026 22:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774306130; cv=none; b=GL1Ku6s2EC9Iz4tsbZbDqUhGwJPfpBsX6FzSrzNIL6KqzgLQ9NTjSoRDXvUmpGEJ9dgjSOzqUkQ8D7/7cB9rydhjiczLHUHy8QxlrOq5HFLyQnfvboqSb0So2Kuyb3XonKbveGlZiQ1Q4fQGpO8I0ArRzE122WAlf+IH6JntVUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774306130; c=relaxed/simple;
	bh=RMwiUT2ca7SpehwMARA0+INqWPmeSfWclA5GGkGeRtc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ahSDvcRnQrxVr54WZFf765FMtRKJ0+JgE4AHZoqn/hcHNPACOIRAsRGN8CwcAfR0dIIwyM5dxxbn3G+vjDVn+icOWiZC4sN3XcSMb0TrCzTA+J0B8JgRAixfLEnmK+cKEYDk/erTrfTVl7CqXp96j9dAHJt5gAREeksMrufLOro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sSJqU6De; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2c0bb213b16so8258885eec.0
        for <linux-leds@vger.kernel.org>; Mon, 23 Mar 2026 15:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774306127; x=1774910927; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FGbAPMtb3fAC8y7bB7RIg3tLmv+zXAom99Sn+GnnvxY=;
        b=sSJqU6DegKv7IdQwHWHwBn6RLPAtdU3yFxud7ldnANkyYkukyvjOiHZd92mNeVkVHb
         qQvZ/+BhQsaC4E06XMg5JJqllbYc1ZSxTTwZB4FsBGCY7Fht0NX+bJGZKsNtHhohmSl2
         qyirqzYfhLMuUm2bKIJxYg+pnUKHNrzN4aRavXpgtxKgroaEUqks25YTCmSSCbPsNIQ8
         l3uRYfIVWD4e5xdMof9QZ1y4DtsVgmjOrRpMYePU2RsvQFlN5v3DXW7Rnos5EMaqvSBJ
         3O6vFYrgmbOxNe8jNyJCRG0g5wCK1zJIlN+BaKRzpbXNPC7n8sluOeE8rVgzkPzKXc8K
         M0Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774306127; x=1774910927;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FGbAPMtb3fAC8y7bB7RIg3tLmv+zXAom99Sn+GnnvxY=;
        b=RaIh1Z5G1AJXwSu+zWMSChD5GhR6JkceQKO8VRK0V2PQNWNqfbjHGHeszzsIX3j+mE
         DOOIraQAsIlIjYNCY9kntXmmML3bohjoSS29Q8hbMgY2hCOG5sdOm/iq2bwSdokk4dEj
         kVviwVI3pfUJP8AoEFhhGUa1KvgsiUfOJgAaKAvZ3FKBNe37TT8RhVK76YOWTyJJS2Sl
         aHwImXoBKEFQvcrfMO+Rc8nVvGxMBRJ4TK4G7asQitag0TyWWUcPsau8pVO/n6hs4UI9
         RqLz5EhDjyh2sTu/Rpbte7G627jhouCLoDswN5eDipsmfYDSpoDruF/po9n9SG6bsJOG
         La8Q==
X-Forwarded-Encrypted: i=1; AJvYcCV/DBGBwR1kIRGj3IH2kajIOAuVpj7N5jpPOJydTzwod678wGSed9H6Q5DqXgMiyAdTR6M7lI7H+sLn@vger.kernel.org
X-Gm-Message-State: AOJu0YzKJE01Nw9JfsOy3PxHE1FhEPkOXuyEK+ouHvLAcgGGabt1OURe
	VMJ3+i5FZVNyGhCCiZd4FYuMK5FNcTQaoWTkZuWRHy3ZGEj3odISwLqB
X-Gm-Gg: ATEYQzx5ExxKmr76nEU46RgSHTImAas24XWJEkcTeEY11Y2LMm61Qfq60hjKz9Gv8Og
	0hFVr0tyOgtW0qIJJ1++aIjCCbsZG/sWHSOyj6jnwyEo064gKg1NILx0znxiH/GDeQVpyAvj3qF
	OhOZHYkuAd6UsmbugfPSs6Uw6O7f3Qbw4sT4+0FLhY9R1kwJgq03YVhp6g7wVw4kPZmC5gz7Ofa
	vVayWH/3vIhU9z7RzpPawGn6rbhbahOFYdrMzRFx9XC4NZfo5honi4VkBphmq4aPOcxUs+oHp64
	BYsrDmSFtTq7pK2f+MS6Q6kNYLdF/Y/KxICtOx+Q8GF242uj5PUsnS8WzrF/W7xeZKIgRoIMNxb
	rjqzhB10qbXNoOLNk+XmHxdUVmnEX1UAfJA1OlxTKF+cYIiUEhi2zawbRkO8oN0UoNc+Ou3gbnm
	uhQt1/nG5fegZMhI5W0DIA17PoSNOPH5q7vyRYpoG5uJi397mteb1zCGdkyPLSoqcD
X-Received: by 2002:a05:7301:9f0c:b0:2b8:4c95:365d with SMTP id 5a478bee46e88-2c1095f54afmr6740228eec.10.1774306126689;
        Mon, 23 Mar 2026 15:48:46 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:a296:1211:5ab0:bc95])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c1313bf5fdsm5080230eec.14.2026.03.23.15.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 15:48:46 -0700 (PDT)
Date: Mon, 23 Mar 2026 15:48:42 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Mark Brown <broonie@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Peter Rosin <peda@axentia.se>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Moritz Fischer <mdf@kernel.org>, Xu Yilun <yilun.xu@intel.com>, Tom Rix <trix@redhat.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-spi@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-fpga@vger.kernel.org, driver-core@lists.linux.dev
Subject: Re: [PATCH 04/10] regulator: of: switch to using
 class_find_device_by_fwnode()
Message-ID: <acHCIA1d5-s2xkvz@google.com>
References: <20260322-remove-device-find-by-of-node-v1-4-b72eb22a1215@gmail.com>
 <360a8b4a-6507-417a-9fc1-c53b14868657@sirena.org.uk>
 <acGFksyx3SA0kJ5b@google.com>
 <7d46803e-b285-4e9c-8856-10100fa0ea85@sirena.org.uk>
 <cf92122d-6b15-458a-bf89-189a0a6874f7@lunn.ch>
 <193e194a-498f-464f-b22c-c283c16db6c1@sirena.org.uk>
 <acGzJV3vKhuty3nd@google.com>
 <09072374-65e7-4792-af7e-97d7df93f9bd@lunn.ch>
 <acG9BPkFr_De-ulu@google.com>
 <27f4ed63-08a2-4621-8943-c50261de31cd@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <27f4ed63-08a2-4621-8943-c50261de31cd@lunn.ch>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7458-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,lunn.ch,davemloft.net,google.com,redhat.com,linaro.org,gmail.com,axentia.se,armlinux.org.uk,intel.com,linuxfoundation.org,vger.kernel.org,lists.infradead.org,lists.linux.dev];
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
X-Rspamd-Queue-Id: A21432FE853
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 11:39:03PM +0100, Andrew Lunn wrote:
> > If there is a deprecated property you can do:
> > 
> > 	error = device_property_read_u32(dev, "prop", &val);
> > 	if (error == -ENOENT)
> > 		error = device_property_read_u32(dev, "deprecated-prop", &val);
> 
> It is not as simple as that. There are a lot of optional
> properties. Say "prop" is optional? And not present. So -ENOENT. We
> then look for this deprecated property. That should not happen.

Why? That is exactly what you want: you favor new one if it is present
and fall back to deprecated one if it is absent. And then you decide
whether to continue or abort.

Or you are saying that new property is optional but old one was
mandatory? Not sure...

> 
> Using of_property_read_u32(np, "deprecated-prop", &val) actually makes
> it stand out, it is special somehow, which is good, because it is
> special.

If you only have of_property_read_u32() then it will not stand out. If
you advocate of using device_property_read_u32() normally but
of_property_read_u32() for deprecated only - that is a possibility, but
I do not know if anyone does this.

Thanks.

-- 
Dmitry

