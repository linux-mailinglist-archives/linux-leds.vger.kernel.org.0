Return-Path: <linux-leds+bounces-6837-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2CPBC2U+g2kPkQMAu9opvQ
	(envelope-from <linux-leds+bounces-6837-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 04 Feb 2026 13:41:09 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A7586E5EDD
	for <lists+linux-leds@lfdr.de>; Wed, 04 Feb 2026 13:41:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DBEE7300D15B
	for <lists+linux-leds@lfdr.de>; Wed,  4 Feb 2026 12:40:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9C373F23A0;
	Wed,  4 Feb 2026 12:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XgxOCnFp"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93BDB3876D2
	for <linux-leds@vger.kernel.org>; Wed,  4 Feb 2026 12:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770208856; cv=pass; b=qBBfh4LAFv47ncjA5tTEKNe7/m/QnRLRCjy8jsZUbW07kDLrLhxBLbdwz1h1A1c18TNhrM60LQYhtKaf4lAxyH+YjYGUoxtYK5Y57YYr/PExrVOTcWcCxb2CQ+F4BoYFqVawoWIL21TP387jv/shkxvrY2+J035ytB2cfGW/FWQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770208856; c=relaxed/simple;
	bh=VVoqN1cbo7saKNRizaznTRjcFiDowh+PjgHqkK04EXg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pMjgyLBvYhvICc8QtOpRWrZGHo1GmsyBxaPALhImlHdKNRwpHS0JqpABqGY+kMpbD6ItpPXxRn8RF3dTAOn0DY+kBUF+aTQN2oPbO+5tOMOuRJxZ+Dt+fKMbgi5AdoG1YdpY4cjFX+6N+mdABNFG9oJHDzJJ8TGFemoUQfOZOIE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XgxOCnFp; arc=pass smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-42fbc305914so6104444f8f.0
        for <linux-leds@vger.kernel.org>; Wed, 04 Feb 2026 04:40:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770208855; cv=none;
        d=google.com; s=arc-20240605;
        b=iObnnJH5dEwI4haoyy2bEDdDqvaIDUyMWV4am8BSAaO3hCAK5kGauACmaK84JcPKSx
         LsHezSSqpruVH6ofoAT+B//brXVxzDaRmEqLHrGfGwPO+XT9tlKQH2QvT5RHkeYO+Sml
         tlXIyYbfazZOBkY0hY/TiEAEG9KFHWtjMbot9Vh3ExGHI9Cmdiw8Bl6r3IvLwUOeKtOG
         cf5wxz/I6b9zI3Lsr3z60zRTe1lX5dfB6PticSTzTyF4tPNMXfpeju00IGgxxkww+lCm
         NfjYovgKPFmnlQM9AOHigCN408dxdM7ukgLGLEoM0W5PNDyovjbO14AYsIujxgKTtcju
         YzUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m/zIsfoECBdgIZPuFNRz333Sc6yOkWK7EWk2qzyAS08=;
        fh=g28qFObOA4M03dsmJR7kA8d2fc3CTwOfW6sMaC9/Uyw=;
        b=jRJoM05tmPpjLvzkFwrU3iizB4yS7Za6IPdpdY20hRT0DTOxsFOWGNbqwzNsH18a9I
         75O/FgKfx5kJ8ZDLTPEju6ip0XXPYe6+p+hoEg3dw1ALsHr7/LgDeJW2aI5fjSn5Q0BD
         hsHK9CsuXKniofpbn1DymJHo88cVtPSId5AmQvPif+VvWZGUz/ZtB+mxhnE2vNVp0FLA
         YpfmoUUPfY65ym8Du98dMxWCrQeGf3utegpV4u4PwBUz2wVxc8+rZpw3AeqLmtmYDPAX
         aJUixHPnUb+6zRFxUC0c83CteGDGfU0IAD06ayqnkOMGLiHsgujOES8MxYzDJH56OSc2
         Xs1A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770208855; x=1770813655; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m/zIsfoECBdgIZPuFNRz333Sc6yOkWK7EWk2qzyAS08=;
        b=XgxOCnFpLIcB14A1aqEtxqTxGYRcjFq2R+iF1g/G5VUZLLl4achDnCyhdFu/2VotNv
         LY9MiT9k8Wicu+tPAzFZyowDFRtmAbjsOAcqM66SIJZhT4kJEd29ilyOsreQ/H5f6XQs
         /cc3ApU/IfhiZYMgbwF7uCnjd9/t5aA43XjucmuSNE6UkG+Gy8ClfhS4JX0CADP/YNP2
         uXEd6w/MNVVlDGqklHl/H5uCrmyGfGJHw4ETON6HTPIbv2OjvZVm1xaiXmsYs31a5XTU
         IPDe0+IG98N/866vOVNahnRtXxTavtQxwwO+xalzKfes4S37JBAiS6WdbUj++rcS9CaS
         pRuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770208855; x=1770813655;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m/zIsfoECBdgIZPuFNRz333Sc6yOkWK7EWk2qzyAS08=;
        b=eyrMiJKyrfnCSV/Mh6hHFj+12vsvTIXsNtoJ9iGSbkDHdBlfh86BW/d4G5u11LfPE2
         RQJc8gdTBfLNkU0G+4BiVzJvBSSsjEVw0+VI1ADmg1YWsec4d+kffLtMS7Oh+DzuOtw/
         QKI3uc2yMWHForkDb8+/i7zElClDoDwXrcseIOS9rkuu9Fybi0tyVFARnjvCqoIEZIkL
         o1c8AQeD1cFKk/nI6TDGcymbyTONijib4FotQttutEYkij3cz5yBJdgxtN/NIOf6WZSS
         2s3EXPG6gzbMbXs3GLga1DZHcwI64tKHf6vOqsNhuYJTS6EUalL+o32EQ3zQRnnfrFSW
         LRDw==
X-Forwarded-Encrypted: i=1; AJvYcCVNt9CVsypKFC5NM5/BAzjhvAzn6QIUB8AYi8wRgtz2uEefNHWKTwM18frVZLm5SVP9J6G3ur8Dt79z@vger.kernel.org
X-Gm-Message-State: AOJu0YzBTdoHXmUEnSeDWcWrYuX0dDFqLpdBBRg6ckrHNLWBRigrkU82
	cRypRjSIs7OGUAlxeEV4qFfXNhn2/NcRwHrFb2wBPdAhbkZtuol4O/yaZild44Voq6mQQumFNt/
	sh/cPcWBI9BYAckZPtxhbbzCo10vRI1Q=
X-Gm-Gg: AZuq6aItcipfEToA6e4wPzWM0SpVSrLzuMcMDRmxw9YySmXw7WW0Qyox6a1P04DvGc/
	Vhwkyvopupn4b0MFH3g6gfuqJOG3aTVXZpF1PKq8ozmt8Cm/UCcb5WlugtbY9YFwImIvOeREvsw
	R/9vM4kSkVtCXwhXKG05st9h/+tZvKdaUZRWg1w56vPXoZOqMg+vkDTiLhzKtM5SlL5V+EdfoYq
	uSmQ9jC6p30HMKnXUj8xvk3r/qEVSEpskDrBbQDRh5zGu5tf8avs/O2Iz2P7QGK961Fn9ma
X-Received: by 2002:a05:6000:238a:b0:431:38f:8bc4 with SMTP id
 ffacd0b85a97d-4361805fbf4mr4039864f8f.61.1770208854743; Wed, 04 Feb 2026
 04:40:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260201104343.79231-1-clamor95@gmail.com> <20260201104343.79231-3-clamor95@gmail.com>
 <2026020350-unrevised-humming-7a42@gregkh> <CAPVz0n35NkEXjur-oJhW6Yxwme_KMLdYCnRAtjHEWSPEVrSUXQ@mail.gmail.com>
 <2026020346-ashamed-campfire-b483@gregkh> <CAPVz0n2HmLwdif5ry+y56LB8Gpwh2o9_gJ7K2jhcZVR=rPgfPA@mail.gmail.com>
 <2026020314-humbling-mobility-c24a@gregkh> <CAPVz0n0TMOCYnMiVUZ7xx-1SqrXuaVCOY-o4-x9L=f-xSMDj8g@mail.gmail.com>
 <2026020347-mushy-lunar-d12d@gregkh>
In-Reply-To: <2026020347-mushy-lunar-d12d@gregkh>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 4 Feb 2026 14:40:43 +0200
X-Gm-Features: AZwV_Qgnx8Hqpc3gLtz5e76GzgExX_xLHyQNYXgz5FpI0RojQ_lqa8cEDXcBX9o
Message-ID: <CAPVz0n0jrRxPQD-g7Pq-koDTW1Wr_FxNZc-SmY2-eE71dfei+Q@mail.gmail.com>
Subject: Re: [PATCH v1 2/9] misc: Support Asus Transformer's EC access device
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Sebastian Reichel <sre@kernel.org>, 
	=?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	Ion Agorria <ion@agorria.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6837-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,arndb.de,rere.qmqm.pl,agorria.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,linuxfoundation.org:email]
X-Rspamd-Queue-Id: A7586E5EDD
X-Rspamd-Action: no action

=D0=B2=D1=82, 3 =D0=BB=D1=8E=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 18:58 Greg =
Kroah-Hartman <gregkh@linuxfoundation.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, Feb 03, 2026 at 06:50:01PM +0200, Svyatoslav Ryhel wrote:
> > > debugfs allows you to do much much more than simple stuff like
> > > BIN_ATTR_RW().  Go wild there, but don't put debugging stuff in sysfs=
,
> > > that is NOT what it is there for at all, but rather, that is exactly
> > > what debugfs is for.
> > >
> >
> > I am removing said stuff from sysfs, that is not what I am asking.
> > Debugs does not allow to upload register values in a form of binary
> > block. It allows only dumping via debugfs_create_blob or
> > debugfs_create_regset32 but not writing. If you know examples of
> > reading and writing register sets as binary data, please point me to
> > it.
>
> You can easily write your own given that debugfs allows you to use what
> ever file operations you want to use for a file.  Why not just use that?
>
> > I am asking if it is possible only to preserve dockram_read/write
> > functions in the code, without exposing it to sysfs.
>
> Why would you want to do that?
>

Nevermind, everything is good. I have figured it out hopefully.

> confused,
>
> greg k-h

