Return-Path: <linux-leds+bounces-8281-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKJzH00iD2rPGAYAu9opvQ
	(envelope-from <linux-leds+bounces-8281-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 21 May 2026 17:18:37 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD335A827E
	for <lists+linux-leds@lfdr.de>; Thu, 21 May 2026 17:18:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C2A730BB23A
	for <lists+linux-leds@lfdr.de>; Thu, 21 May 2026 14:15:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A75603F23C2;
	Thu, 21 May 2026 14:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sz3T/M20"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B963F1ADF
	for <linux-leds@vger.kernel.org>; Thu, 21 May 2026 14:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779372795; cv=none; b=nLua7vfBi8xYG+7nMMwACduTpqd2QncK+M1oLvGw4ImjRwrLXZ7yeQ+Ie9vB797A73K1Qkgw+DmQ9r6wKwrP/wUF42s93jh3olUo7eDEMZmexFxdZ2VPIsq7SPZW4W8ElpYcTA/EMpVWn+ebWfRA1xko9TWg+PsCfGwNQpFSppk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779372795; c=relaxed/simple;
	bh=RUXhdu3A/5Y9NzHNYpLYuiIiXuy3f2lK9W2KiI0KTl4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eD6BjjHQDv9j1VQ8ICIK4n5Cmv+z4TteyxDT/X15GYzj/R/Pn3SNkLfOKbmmsX/FPNhMdlVm9XMviywV8BIw3aYn1uVr1NFKvgnD0lBdEckfch0jDR3wtiNV8pISqZVu/UwyZH033Xz7Gs5lC5KkKYArIx1+wt6oPTA2k3VdU8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sz3T/M20; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-393a49d2e5eso55875801fa.2
        for <linux-leds@vger.kernel.org>; Thu, 21 May 2026 07:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779372792; x=1779977592; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nU1KLRskLNe07l1ENeGeB86Y/M2JwprsvHaEqJucuEU=;
        b=sz3T/M202Q5wZdzs8YZycHfmEpXDVelRUw6si6QIRkh/5Vp19EKg3AkXNGUmirLklw
         vxsqWjcn/BzUwFni7orZGT3uJSSH3NSWdJUEHXyWctmaWXJu4mFghMmocovboPpt4SnZ
         qtVfEKhWqnQ99g8W2ZEuaJtLl7FjZECzpf9BGxSnLaKod32VUJMu1laAjsgoJ4z2co1O
         Fwr8tV7SadaoO2bncTK4jqfZkvMQyzmxI+hGHsHY53nNnR7oDZbIXWQP3wehSeR6Ft+O
         bPkiBZ/Wn3YwYkSbz09/Q5F4BSNuCX70B31AZyVLmr3o3w54P9ka432ZnbzbcsUTYg6L
         qBdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779372792; x=1779977592;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nU1KLRskLNe07l1ENeGeB86Y/M2JwprsvHaEqJucuEU=;
        b=C9ZPfWYUN2VTafi/gngHC4IttjcZ2vyMHoQwvyhWBggg3oaTcNM6NZZUgPVHNDgEbN
         +00gwBPw63uLtha2umG2Wna9HnE+L90VDMYefcNHzcqXYt4LKztIFYkmATVVyp4PnqPu
         mRNoQsPHH4EVSp9ILiDaz/kouz6bBPbCj508P9x0UluwPISedBeiLn1nw/Hb99CaiTAd
         fB9VvzDPdJ6ApoLMaY3pxu4dAHUWJmqchlp0151IMS/QcEOt6zYmZ1upU2qALEYrPv6y
         YfdeAvs5bq16v7zIsWiqv9YDDTuoaHfQuwK3NlvzVMXnYbyozCG2jLIsa2lzn8l4H9/m
         Y3AQ==
X-Forwarded-Encrypted: i=1; AFNElJ/JQS5slRdPutrlAmX9QIO+BUHC/sSaTRknGYYSxAerXyWWz6Akg7W4XCCL4EpIVJaWDNrmQHrb9P62@vger.kernel.org
X-Gm-Message-State: AOJu0YxHP9Xb8fJVlnSry8nthybuy/6BAb5PIcGswOK7Usu6aPomf2nV
	3IsZSx2f6nr2Uco+lNIrLLzROfYaJSKIdNLjp6uZMsEKqk1sTYmMBMVo
X-Gm-Gg: Acq92OG8YpK3erVNJ4rR0Fd359CR98KSpUTWahWQsqLRH+uQEhlOvGvCvJ+3m7vVS+v
	TvPGq/VBLd3ezDiB+Nf8ZUHTRRikD+TSTPKqG4t+i9OgdQjB7F5Eafh+6bp7nvMG/7bbsA8cgo6
	oaWra2TelTm38V55FgpDyluCFPn670L3BUG7CMsET8hMlr+U0QJDIH1TDk/vnlOrEH90mcYKRKH
	rSYhHP3DE3/0w0MmFtNenDG7Tjsk/dZtO83wUZVV9ae77rDzQmtiIR5n0xTgVbS8lkzZm8QeRXn
	BarOd+JqdvOhxecP2az8YnNrnDCTNZN1npVU3Zlroi5zRLiAMWcqgqLTb8NYct+I5cbIFJpCfoI
	GlGRiicNfxrXqfProe24LTGpSr4UtTwk6cV5kQHXAsWUtInIankKrOq8e/sTAodQeTkvHFz4AJX
	G5IwipCJxBvfaP92PxF1g4jq7RiAnBw5qMm53KCxbaGiE8pO3cRQewgFdU
X-Received: by 2002:a2e:bd17:0:b0:393:71d3:d019 with SMTP id 38308e7fff4ca-395ca60e1cemr13617271fa.15.1779372791941;
        Thu, 21 May 2026 07:13:11 -0700 (PDT)
Received: from PF5YBGDS.localdomain ([163.114.130.5])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395d0b49073sm2787241fa.31.2026.05.21.07.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 07:13:11 -0700 (PDT)
Date: Thu, 21 May 2026 10:13:06 -0400
From: Mike Marciniszyn <mike.marciniszyn@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Alexander Duyck <alexanderduyck@fb.com>,
	Jakub Kicinski <kuba@kernel.org>, kernel-team@meta.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Daniel Golle <daniel@makrotopia.org>, Kees Cook <kees@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>,
	Jacob Keller <jacob.e.keller@intel.com>, Lee Trager <lee@trager.us>,
	Mohsin Bashir <mohsin.bashr@gmail.com>,
	Alok Tiwari <alok.a.tiwari@oracle.com>,
	Chengfeng Ye <dg573847474@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH net-next 0/3] dd LED support for fbnic
Message-ID: <ag8S8p-znkBc2WTP@PF5YBGDS.localdomain>
References: <20260520200337.204431-1-mike.marciniszyn@gmail.com>
 <48c64757-dc3c-4d05-a269-fa4f50c299c3@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48c64757-dc3c-4d05-a269-fa4f50c299c3@lunn.ch>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8281-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,fb.com,meta.com,lunn.ch,davemloft.net,google.com,redhat.com,armlinux.org.uk,makrotopia.org,gmail.com,intel.com,trager.us,oracle.com,linux.intel.com,vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[24];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mikemarciniszyn@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,netdev];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,PF5YBGDS.localdomain:mid]
X-Rspamd-Queue-Id: DBD335A827E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 20, 2026 at 10:14:46PM +0200, Andrew Lunn wrote:
> On Wed, May 20, 2026 at 04:03:34PM -0400, mike.marciniszyn@gmail.com wrote:
> > From: "Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>
>
> The Subject: of this email has an off 'dd' in it.
>
> > The second patch stors the max speed from the firmware dialog
>
> stores
>
>   Andrew

"dd" should have read "Add" (truncated by copy/paste).

Correcting the subject I think would mess up subsequent revisions unless
I retract the series, consolidate the ID mechanisms into a separate patch
and follow up with the led class patch wrapped in a better cover sheet.

Mike

