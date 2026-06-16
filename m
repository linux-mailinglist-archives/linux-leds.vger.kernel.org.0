Return-Path: <linux-leds+bounces-8618-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ss+KC9m+MWrUpgUAu9opvQ
	(envelope-from <linux-leds+bounces-8618-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 16 Jun 2026 23:23:37 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A74686956AF
	for <lists+linux-leds@lfdr.de>; Tue, 16 Jun 2026 23:23:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=b19JHsqJ;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8618-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8618-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7143E31853C1
	for <lists+linux-leds@lfdr.de>; Tue, 16 Jun 2026 21:23:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 289F739B96A;
	Tue, 16 Jun 2026 21:23:34 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76D2394E80
	for <linux-leds@vger.kernel.org>; Tue, 16 Jun 2026 21:23:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781645014; cv=none; b=jO6L4e0FWh3xko6ohF83xDuNJNvXottmuvhx/QF23Lt1lD+ni/jU/jy9c+C/7afb4qdetK8x0dPHi0H5BcdttC7uxNeYaH+rnOB5slkKAaDBpXswQPAUP0bwsfD3ykH5ArxrLR4Kxyv10SooL1Qmt1KNTFhG/zZB+Ux23sIFSmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781645014; c=relaxed/simple;
	bh=tOJ0BjM0ldVhSsSRHlSMBhHPNTPDe2oSS1RBcYunUGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BHsOk/pKJLpqY+kRGw5iIyS6lq4t3x+5q1bPm9Bwon1v1mdBF4tLNpBn5GDRek10IKYIugGcUFoC81MhNYacbbVhSLWX8XZGDsIeBgsimVONq7OmJdaO8lWb/QBUARAH9I2FAmbZJtqjJXOORtESxnMvpuKQ3IQpcsxwq81H9D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b19JHsqJ; arc=none smtp.client-ip=74.125.82.180
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-30bc806fcf8so514778eec.1
        for <linux-leds@vger.kernel.org>; Tue, 16 Jun 2026 14:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781645012; x=1782249812; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kVGHWnnJ0bnpjfbLQ9kiQcWUR79CsLTM1nJ13tFxcHw=;
        b=b19JHsqJ5m57yk8F1Ppz9Zz8y5Vvmz7mf6EkhSHLdJr0HbRrL5ZLsstiM9H/54Am4w
         Iwat9IWtbxJpgbsREgmnTza00VP9dVTBfIt1Y/QeyA5yV+im30tVKzekbRH34ghNxk6d
         AmyxXW1NQXNCu+IqPdtV3aTKtM1anr/yJAr7ZYmyh5MO8ReVE3MEPTLYfGIvPthn0X0Q
         Ur7FLNAACsrCKrUdzE/kDpmisHP/l5sgjWjHZQV444AUMXnE2ZYxJWYngNjXWs3HBANP
         lpMViTDfIK81/XszIWqAyOvPrq+gnj0CGM5WGwAA8hbVUFSM6H4tcafNnm25myTJcMVo
         d9wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781645012; x=1782249812;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kVGHWnnJ0bnpjfbLQ9kiQcWUR79CsLTM1nJ13tFxcHw=;
        b=PDcFnQjAFPEXZ2JP8vP1buoJ1HACoebXolrfeDO+TGrfjX6iEckUT0352MkVRhs1HQ
         nAEgKKa3QRHyTXsta04SoB7Bf9zF2MBJsw1J6WTJnZk26yBMCTtBNm7yKu7MJxdsssnR
         ShFsiq/btxnlLmBokRNxJtIQV33q58TtqxAlN/WQvMvGM2BdEoqaZbkyGG7PpgscZdw8
         RR12NJUle/pFFIv5YGKlTPcUlvvnG0MTKG+rEzhwWquM6M+K8Pz6BwytnVhvBhTKB74q
         kzStMbntVTs3eyBk0HtASQS9QbMK4IU1Nx2rBw+ianEGMLYLdwTuNt8YBVf131SSL6ls
         yh9w==
X-Forwarded-Encrypted: i=1; AFNElJ+Bb6JDHUCdAe1xThoiNtbmPZs3acp0GPmUVXpzoPQP0QvfNNpqXTUIwEdvv5Gjh7sjIMDVYwG2M6WN@vger.kernel.org
X-Gm-Message-State: AOJu0YxlykgBmkG7eRn3LIYW0alO+s1e+43nbV9jF7KwbCpH1TEL6f/N
	SXjNH85+MnIv/YmHN1usU5CaUTzbRBrmKOP+u51vxbU7kmXo9I7h/tfE
X-Gm-Gg: Acq92OGawjZGqO9eFqFtRX/tWwxH51dAygemw4aWJefVSjI1oL5ZEUNNEjl+Z8HZp+v
	keSPc35s7+Vi9OqIwD7yPmMkwwB4+s67e0TZD+84n2uyKAQMNWd0o+IZIsZEzdGNwz1ENccgtlS
	OtZ74g28XKm5w+oQBr4I8LbYAlydUS9udPx30cH/jZZyI6bmRn1FcUPYHKnI+87hxgpq/+/kf7i
	NemjfySmLTOgJdI24e+fOwxRbz4fyeheo56wRgM9GcfIKNKO9Voo3+NoW5n5IOqIXkEy8q2kT2L
	9AqeJUtYXsS48NynA8D1+D31mI32/02FP+Zru89S7/C7fnN07gxFoTOxNokijBEbdWPZJlM27NZ
	BElKak0bsOcIMJsqFh2qauyMqOaEVOonR4cGa5vhYqx8GwUTeB8uaTEe6ObQ0nPKSXyeyLj+IcF
	Mzqko7wgGgr54Q45AxZXYYD9UiRHkX8O4s0g8qnloREY3Xl7pbGTCdeIuY7T+1eFQ=
X-Received: by 2002:a05:7300:8c85:b0:2f0:5605:466e with SMTP id 5a478bee46e88-30bca92de91mr522312eec.9.1781645012000;
        Tue, 16 Jun 2026 14:23:32 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:cbae:d24:189c:2cb9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30bd0deead6sm109387eec.26.2026.06.16.14.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 14:23:30 -0700 (PDT)
Date: Tue, 16 Jun 2026 14:23:27 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Sebastian Reichel <sre@kernel.org>, 
	Ion Agorria <ion@agorria.com>, =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-leds@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v8 4/7] input: keyboard: Add driver for ASUS Transformer
 dock multimedia keys
Message-ID: <ajGyejCSRMhY4G2R@google.com>
References: <20260528053203.9339-1-clamor95@gmail.com>
 <20260528053203.9339-5-clamor95@gmail.com>
 <ajDPtOyr8GJYaVYQ@google.com>
 <CAPVz0n2fnM6zYtP9bCtsY9mcLdce_R+1UPmMo0o4JRgjnhuhKA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPVz0n2fnM6zYtP9bCtsY9mcLdce_R+1UPmMo0o4JRgjnhuhKA@mail.gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:clamor95@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lee@kernel.org,m:pavel@kernel.org,m:sre@kernel.org,m:ion@agorria.com,m:mirq-linux@rere.qmqm.pl,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-input@vger.kernel.org,m:linux-leds@vger.kernel.org,m:linux-pm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8618-lists,linux-leds=lfdr.de];
	FORGED_SENDER(0.00)[dmitrytorokhov@gmail.com,linux-leds@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qmqm.pl:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A74686956AF

On Tue, Jun 16, 2026 at 09:25:25AM +0300, Svyatoslav Ryhel wrote:
> вт, 16 черв. 2026 р. о 07:26 Dmitry Torokhov <dmitry.torokhov@gmail.com> пише:
> >
> > Hi Svyatoslav,
> >
> > On Thu, May 28, 2026 at 08:32:00AM +0300, Svyatoslav Ryhel wrote:
> > > From: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> > >
> > > Add support for multimedia top button row of ASUS Transformer's Mobile
> > > Dock keyboard. Driver is made that function keys (F1-F12) are used by
> > > default which suits average Linux use better and with pressing
> > > ScreenLock + AltGr function keys layout is switched to multimedia keys.
> > > Since this only modifies codes sent by asus-ec-keys it doesn't affect
> > > normal keyboards at all.
> >
> > I think using input handler to intercept ScreenLock + AltGr is quite
> > awkward. I think this also passes the original key events (unless you
> > make it a filter not a regular handler).
> >
> > I do not see benefit for reacting to AltGr+ScreenLock on other keyboards
> > to activate the special mode on this one. So given the fact that you
> > already mange the data stream when you split it into "serio" ports,
> > maybe just intercept this key combo right there and create the input
> > device and signal input events right there?
> >
> 
> Though it seems awkward at a first glance, media keys are integrated
> with a standard keyboard in a detachable dock. It is highly unlikely
> that media keys will be used with a different keyboard then the one
> that is integrated with dock. Additionally, the ScreenLock key has a
> code specific to this driver and is not in general use, so even if any
> standard keyboard has AltGr but none has ScreenLock specific to this
> driver except the dock itself. Handler is also set as observer so it
> should not interfere with work of other input devices.

I am not concerned about it interfering with other drivers, I am
concerned about it unnecessarily connecting to unrelated devices
(anything that declares EV_KEY).

Again, I think having input handler is not appropriate here. I would
fold this patch into the patch that introduces the 2 serio ports,
enhanced the data stream analysis to detect your key combo, and then
report through this new input device. You do not need to have the round
trip through atkbd and the new input handler for this.

Thanks.

-- 
Dmitry

