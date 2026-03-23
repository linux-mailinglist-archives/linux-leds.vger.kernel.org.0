Return-Path: <linux-leds+bounces-7451-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QCDBBoOzwWnlUgQAu9opvQ
	(envelope-from <linux-leds+bounces-7451-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 22:41:23 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DAA2FDDD7
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 22:41:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 257A33028021
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 21:41:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2774637FF77;
	Mon, 23 Mar 2026 21:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bvOMxUP3"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFAA33803F8
	for <linux-leds@vger.kernel.org>; Mon, 23 Mar 2026 21:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774302070; cv=none; b=dSSY5pH5qZt/T2a/iBrtb4H5vs8nRx8bh8gNcVZv7ecTdWP70lJWdLnYc6iQTUzwrLOqrcnwehe41VenW2MlE50oUrsTkS1EVYUPfF/+wNIGgmvzVQ3R6JyLMFrAgZTbe0rM0PoFQXi83TyuXMCUiD0CFQLRFzh46mPqNlNoqnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774302070; c=relaxed/simple;
	bh=Ia2wOeaNxrGGSqm94OjQXh1deCH4whLtBppic3PUk3o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jKQWXUacUvKQkp3GHUIXHcM7ya4dQ4aAJ/l+jNYr2KQa2Va0wjtdgDnrYlyd6lL/yYPixyS7JAHMliIrCwAZQu4gv/ud4tteykn968rxclO+0NAMHfHc9STvgC5w4Ll7dZ3lNBi712vgNa70k41AfLwdhxWXcw/1Qpd3u8J4mDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bvOMxUP3; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-126ea4b77adso4850660c88.1
        for <linux-leds@vger.kernel.org>; Mon, 23 Mar 2026 14:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774302068; x=1774906868; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q7HCZ5YthEu6Sto4GADNi5rznGP/hi6UoU7AjdQU+RY=;
        b=bvOMxUP3ynayoZoyQiQubkhgSB8gwVBqoVcFi/egyb7w2owvUhwCU9zc4g2v3ctqCD
         B9O8oZmoaNmgoTpSUMugSavwhcQw/Mk62VoF8VU3NhecFu88XPN8zcD+HbSLj0oXUxyC
         Uak67PuSuJwMSOBapnvPrhpdLqV1WnYkFhMp0VHFSaRHSdPftLaCsO+8090CSi/ZEuUY
         H4EOf4cAnGEcPNfQutrSMyl++XsVQ7+a2ez+143H+ogac1wgD6++YgqtDxYVnCbtV/JL
         8MD7fp/sk3fLbgxnYX3lRnrh+ZSq7NEE7mMTUXvIWVLVci3z7Cao4NWPVIreNe+fwAv6
         4UIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774302068; x=1774906868;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q7HCZ5YthEu6Sto4GADNi5rznGP/hi6UoU7AjdQU+RY=;
        b=T60wl5TFW01g1zbfKVs/qk7GhZ9G38FrLjVrvqwJEK9NzLj5IbZin6pPRfXX47G+9d
         JPu5p9xpmW0PLJ5ZRytCqlxQdDvjC5+3Cqp9nPchWwcCGgirbQgRdt0UW/PBqTaYcyD/
         gj8FbvMTzO47WIbA8/aLq0TDTHXd2hmdYkhs3uTYqN65O6kSdSSHmP3wrqlYtBRJzKpl
         d7WrDbxyJLH6Er+umHTQ6/IKSSHVlpdz7nvEm2cGcgtmBfGxlI1Q13C4wJu1B/jwYQUJ
         wmt9dXiDqsFKrwS/WbbGNmDpeDZQb0TfpvWrFtvdNsTFDQ+YzcX3O+NrzXQnri6nRh0Y
         DPeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYwlFSNst3/gj6zDe/Oc+pOmglCLFXHWROk4czCagWjohWtvttjbzEXo14DDcIxZ8fZvm9Do1Hy58a@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8OMKo7o8dd3obB8Fk3jPRWQCXakKhiEtuIgJtrpk6j73evCzM
	FJTCqcpXe/sbvPqTvjcYDOSGBXUwa5trrkvpyjYJ0JWTXOtp9pJI2Fln
X-Gm-Gg: ATEYQzwpydQzttwgZ5iPOY39rimLCvSFgWaYZincW8/Y0CuPBXCaLxlwKV4E0ualpys
	aEu96vaJpUY3xno+8DSZo+Ofte4tit+WGnZAjlRMIq754ykOxAuIh95+90i5ecMTB+ltbVrIn1W
	NUsDR385INhxO6TfeS2AagD+8XRR/DXCDmpsR6TU5xKFG+2fS9Z/PnCUa9qm/GuCgXnWTP866Cs
	0Gw/3VPolI3J92mEnS5H+aA8xhSKIB3fk2YWHMnKlcPpZ5q0nEY6cK+I6XfsAgeAFkHvvIcaGuv
	/yJkn//4cIB/0Btoapt7XjtHCnvSZJw5MUeQlEJ+Jx7ie5fWvE+37Q2iY0uQ+nkrRCjPptRydFX
	rTEoaSPeuTo8lQxE4rl0bM8mMICDboc+WhHHq2wyET89991gFIoFuURcrnoihHZg2Zv09/ybVt0
	/jTOdyS3WSF08alhVEBX/kMApajl2PjmU6E9xYHCW5H2R9bBkIQsvEjhZ9MGaCHequ
X-Received: by 2002:a05:7022:31a:b0:128:d24a:a5ba with SMTP id a92af1059eb24-12a726cafe2mr5295048c88.20.1774302067990;
        Mon, 23 Mar 2026 14:41:07 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:a296:1211:5ab0:bc95])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12a733d199asm9682893c88.4.2026.03.23.14.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 14:41:07 -0700 (PDT)
Date: Mon, 23 Mar 2026 14:41:03 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>, 
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
Message-ID: <acGzJV3vKhuty3nd@google.com>
References: <20260322-remove-device-find-by-of-node-v1-0-b72eb22a1215@gmail.com>
 <20260322-remove-device-find-by-of-node-v1-4-b72eb22a1215@gmail.com>
 <360a8b4a-6507-417a-9fc1-c53b14868657@sirena.org.uk>
 <acGFksyx3SA0kJ5b@google.com>
 <7d46803e-b285-4e9c-8856-10100fa0ea85@sirena.org.uk>
 <cf92122d-6b15-458a-bf89-189a0a6874f7@lunn.ch>
 <193e194a-498f-464f-b22c-c283c16db6c1@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <193e194a-498f-464f-b22c-c283c16db6c1@sirena.org.uk>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7451-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B3DAA2FDDD7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 09:36:07PM +0000, Mark Brown wrote:
> On Mon, Mar 23, 2026 at 09:01:47PM +0100, Andrew Lunn wrote:
> 
> > How do you handle deprecated OF properties? This is a problem i've run
> > into before. A developer needs an ACPI binding, so they blindly
> > convert from of_ to device_ without engaging brain. As a result, they
> > bring all the deprecated OF properties we want to die into the brand
> > new ACPI bindings.
> 
> Honestly that one hasn't really come up much for me - not too many
> deprecated properties.

Given that we position properties as an ABI even if they are deprecated
we supposed to handle them forever. Newer properties usually offer
benefits over old ones and that is how users get moved over.

Thanks.

-- 
Dmitry

