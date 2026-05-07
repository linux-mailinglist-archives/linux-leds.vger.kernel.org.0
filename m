Return-Path: <linux-leds+bounces-8038-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKmAAPi//GnSTAAAu9opvQ
	(envelope-from <linux-leds+bounces-8038-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 07 May 2026 18:38:16 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 927C84EC55B
	for <lists+linux-leds@lfdr.de>; Thu, 07 May 2026 18:38:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3EE593010BD7
	for <lists+linux-leds@lfdr.de>; Thu,  7 May 2026 16:38:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27BEC3F0AB9;
	Thu,  7 May 2026 16:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N65ATd7b"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A461F09AD;
	Thu,  7 May 2026 16:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778171890; cv=none; b=DgsCwGhOqVHSdSV5UBId2k/OmL3Qu/D+fqCKsIFa8G82mSreHIuDE5RzqHOW4n8bUFD2bfkARySK6h5apyoRL3mUuQfFiR9luV67QVdn+YYFF849XDGmsfNUnBa+mAIC2M/UYfqTGJZrqAC2ybn9IsMSDtcHZtXUzPoi39WC3c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778171890; c=relaxed/simple;
	bh=fFFvoBpEPlWmVPJsebUWDLG4G3lZFuRKLCXov5Az17k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XMlT5adfw2evlc16PIBxeMkq8kEySqSOg/85SPn8XcrWX2EJEixUxD3naJBqxMuWzZSYcqhugusmfDaRZvDA7vbk4TF7Jr6CL25yB3r6vBiDjp+YpdsKxt/CT2RYTyicibA7JUt2CmUEkYSD5aw+0Yqi8zY/AGGXw64YG5DbF6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N65ATd7b; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51317C2BCB2;
	Thu,  7 May 2026 16:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778171889;
	bh=fFFvoBpEPlWmVPJsebUWDLG4G3lZFuRKLCXov5Az17k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N65ATd7bmdVIIsPurO7XPxnrkcrEBmRB1I9jgt2IBAoBLyzljW0LXl2S+6PwM2o7h
	 XwrYX05UPXrEJRePYZl3Lv3NzCsdv1Vp+md6AQ1rN/zzblsxVsQ4SwCwi9jI4NqHQj
	 CLrWAokdAVAEACj4cgw843o218BcdAaNbEL9ABYU1/Wn/GWao4S08vb7+/QzgxxfHw
	 yM4f/Uytjoc6bED3VNlTsYU8I+BVpJbwcPfsOJeSuL0vMdIrvNviTT6BVyXuzVbjp4
	 TMA4ru1UyZq3kaAcpHhuB0kE+MNJQV2QLo3mavQp+3+Y/qii1whF0yQeFG28sMQCMR
	 IfBXMWCV8pebg==
Date: Thu, 7 May 2026 11:38:07 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jun Yan <jerrysteve1101@gmail.com>
Cc: conor+dt@kernel.org, lee@kernel.org, pzalewski@thegoodpenguin.co.uk,
	linux-leds@vger.kernel.org, luccafachinetti@gmail.com,
	krzk+dt@kernel.org, daniel@zonque.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4 2/5] dt-bindings: leds: leds-is31fl32xx: add support
 for is31fl3236a
Message-ID: <177817188617.2027028.14674964109228085568.robh@kernel.org>
References: <20260505145354.1267095-1-jerrysteve1101@gmail.com>
 <20260505145354.1267095-3-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505145354.1267095-3-jerrysteve1101@gmail.com>
X-Rspamd-Queue-Id: 927C84EC55B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[kernel.org,thegoodpenguin.co.uk,vger.kernel.org,gmail.com,zonque.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8038-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action


On Tue, 05 May 2026 22:53:51 +0800, Jun Yan wrote:
> Add an additional and optional control property for setting
> the output PWM frequency to 22kHz that exists on is31fl3236a.
> The default is 3kHz and this option puts the operational frequency
> outside of the audible range.
> 
> Co-developed-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
> Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
> Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
> ---
>  .../bindings/leds/issl,is31fl32xx.yaml        | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


