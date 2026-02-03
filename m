Return-Path: <linux-leds+bounces-6824-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EF6rHevZgWlYKgMAu9opvQ
	(envelope-from <linux-leds+bounces-6824-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 03 Feb 2026 12:20:11 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD47D82D5
	for <lists+linux-leds@lfdr.de>; Tue, 03 Feb 2026 12:20:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E276C30BD307
	for <lists+linux-leds@lfdr.de>; Tue,  3 Feb 2026 11:18:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39AFC333451;
	Tue,  3 Feb 2026 11:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CR38R0no"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC6C330655
	for <linux-leds@vger.kernel.org>; Tue,  3 Feb 2026 11:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770117514; cv=pass; b=TcrtLz3sdTlTP/RuzvPbLNBuAbOjIubssS3K3x/gdfu2rBKUIboUgVS4MCzP8qIlQAhx6gL4O8kRRTd3q8Ocn7Y91QDjuAMjEp+0CCb+KifQmejhUOAiebbXi2vPVA9mbMDahU63BnWUtiQggRdoO7zEWR5IjwUrN1KxnIhjTWg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770117514; c=relaxed/simple;
	bh=x0ozsReFvwxqdxxBW0bsucHLklQvL5qKhZ07z2jxlOA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e4MM7Q7WiqHnGZ++v5Bmw5e4qa8W5oOH13RN6tIe0pmH4IGG074sjQjcyJ+2PyB9dfVbqNHd2Q8u8XCWRNLie8b40S8gmTFx0nikF+vwnpO4tuyQ5O9YADzMjcEpgn9vmAEeOEu2fa4zf7vIy8YXZ9zqk8HU8t8da8wh2Nei0sw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CR38R0no; arc=pass smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47ee0291921so52420095e9.3
        for <linux-leds@vger.kernel.org>; Tue, 03 Feb 2026 03:18:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770117511; cv=none;
        d=google.com; s=arc-20240605;
        b=dJhGKKRqRO/W/sbFLcrrRAv0dovYeLU0JDLh13q4isEVR0RHDZDcJ8wvtn32Nmbaw3
         XjDbh0QCqE7pzozaZwA7Zn3LhQkExFcCcwxDs3xRklyc8LAFXymyuKU5UkttuJe33nrI
         hABdNNfmoo78nUdWVgJx/Imm1ltaCFuYr2EktBBkOM72PhaiOAAdhCRj+Prc/MSyWYQA
         v/uwP/WGfOkY195drE+kGWJX66zhp85DEtQnqXbjQ7pYXuVJNHwmJcT7sCWU5VlvaRes
         Oq1LvQsxufd6nC7rE3sZVtNilxLVjFu6+zpUqJljl2TMbR1HtF6wR+8NoBRpS3x9VdHe
         WYMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2zZNMGa3yn75FsqDEZyP0PuDAGN3sitzxX2byO47nv0=;
        fh=PZNHhSB5odnD5bhtSh5VJZ1cssTMxNA26+K1CgbyBMU=;
        b=dMcTKwCuouyyrUjRuPZIq9Rv5VQG0NT4626JyS11Kuck6Y0bJIzCbT1EZ0BsyMTYKL
         c14GPz2dwKnpudo1hjTMSIXpbK0bwQlx5qVUbm5W9sKSwiQt6pc8Ym1qer9jwVZ83v0t
         4x91dRccLZVrdCqqK4d1M5Ga5ZUVy6U2aijemgESZS9dqkOvz0duqsvH7dFrFRjHb4XN
         5kJBxHr3h2nXVct++USfDOt1tcrDiEPFywdhQ5zoZb3/JSW3l4DIMLih/RyXHmFd95aL
         6MOotIcZBLGb7zhDFc08cPNyDvEQpWcTNbE3RHSbswe+r/jDUfN04eIu2qMVFIEeEuRF
         GFtQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770117511; x=1770722311; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2zZNMGa3yn75FsqDEZyP0PuDAGN3sitzxX2byO47nv0=;
        b=CR38R0nobPSER2TyZ4NQnKNQFmU8280WcWQeveL1FiVa1jy1p0hTfo/fYR0DxZ/Dfq
         227hwIzSY8zyulWXMhJy1ilRwNdo7bOkpfKGNk/jf/3ic05KANKYyYHfwB9IcTjbiiuj
         p40E0biNTgPNkBryF/S3zEG++0TdkAlUKTdEsZZqEt2n+25QgIMklWtnzoTFzIDCMAbj
         S5fGBmTP94HJCosPKdVubJOMDNkJ1BbUnF2GJNpihtI9H6m3O0rJyF76OV8B2pbWDukj
         n8b3/KXIhhf1WA2dpRpi4dW+LVGqaij7UIXvK0mKzU1cwJnFxljqrv+FgT00wXQwYIPJ
         9kjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770117511; x=1770722311;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2zZNMGa3yn75FsqDEZyP0PuDAGN3sitzxX2byO47nv0=;
        b=R+zn3/FJLs9CocjrXaIP+R2+zGDF/vNA9tItL+30oDHhBPqjXIql1QMm1VXPV5OoAR
         F/Z5wtPsyQOgil/W9OcU501FJ86+uecHyvrqp15C2MVAeZ8fg8NGmQBrZ7xQrv5H0Q1r
         3dJu4iUdcUCM2PQ1ntXUCQrNEOc9AuyYiECvUqmvVUBm3GDhpvhteUYbkVkA7PUqQQET
         heKLIZ2WyMDyYD1M2GvsqEP6OOvH7vqaZ8MnUDmUB5b/HdsI4AuP4Rky2jT7vCEk+dVT
         9YebJHoEFi+P6e/tKQEXaqLacK1dcm4jBOGUR5o2L1ODQw6hguW52+YW6umn3kEKAi+v
         2uWA==
X-Forwarded-Encrypted: i=1; AJvYcCWyatycB8CBJnFEmzX+z5b/OzFsEbiohPKsJei/AXKrtpc13pV5d00jd93Pj4AukgcNsbj7A+6TvJ8A@vger.kernel.org
X-Gm-Message-State: AOJu0YzSVYm0GmwgOLBf1l5RG2gjSSrd0ADc06uhK0WoILROKKk0QeVw
	FdLeGWZn8cF8Vqh/G/dG6gGH8rOZ6EdddfPWiNB08kja6jNFPvZGU2Yyhwpe8mFkQ5ZP1zMmGxB
	umWdqPH0Pmb3sNNpFbRiKPXVRGmbM4EM=
X-Gm-Gg: AZuq6aL0szdnSMz5E1uXBlmi9TE/jUqyGBahWTr/kv9wHQpfklaxMF9OvGpgJEsQX96
	JOVNtp+cqwd+DLq8MuARFcb/FGllZ4jT5BzOq+5Ovy7ECRKFtP2ED0fJZdNWdk7HIwrXBchnX0B
	TQveJs8HGdjxnwc1jgiwyeQJSY93CbGVSoL9jNLR3nj1GpHY7ZG+H1BGgnlGbOtI3mTzcdBpYa/
	hn/mQJP5wneZ9LehKl//+/61jpLD+6MsAdjZZ+qaY6r8z4/oMW3KRctlJsxlV9s+vVY5xJg
X-Received: by 2002:a05:600c:1c06:b0:480:6bef:63a0 with SMTP id
 5b1f17b1804b1-482db4d859amr196633815e9.21.1770117510819; Tue, 03 Feb 2026
 03:18:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260201104343.79231-1-clamor95@gmail.com> <20260201104343.79231-7-clamor95@gmail.com>
 <aYHU5g5iOVjrHrE_@google.com>
In-Reply-To: <aYHU5g5iOVjrHrE_@google.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 3 Feb 2026 13:18:19 +0200
X-Gm-Features: AZwV_QheFCGeHv9dTwRKbCZ3hfG3HmOrfJbSWa64fyut6TH7i-1Px0zxlCCElGo
Message-ID: <CAPVz0n0YXJ2KdO2LPJ8gYr_8=TuaEnY+=sVy1AsiiNtJG=nx3w@mail.gmail.com>
Subject: Re: [PATCH v1 6/9] input: keyboard: Add driver for Asus Transformer
 dock multimedia keys
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sebastian Reichel <sre@kernel.org>, 
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6824-lists,linux-leds=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CAD47D82D5
X-Rspamd-Action: no action

=D0=B2=D1=82, 3 =D0=BB=D1=8E=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 13:00 Dmitr=
y Torokhov <dmitry.torokhov@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hi Svyatoslav,
>
> On Sun, Feb 01, 2026 at 12:43:40PM +0200, Svyatoslav Ryhel wrote:
> > +static void asus_ec_input_event(struct input_handle *handle,
> > +                             unsigned int event_type,
> > +                             unsigned int event_code, int value)
> > +{
> > +     struct asus_ec_keys_data *priv =3D handle->handler->private;
> > +
> > +     /* Store special key state */
> > +     if (event_type =3D=3D EV_KEY && event_code =3D=3D KEY_RIGHTALT)
> > +             priv->special_key_pressed =3D !!value;
>
> Is this functionality supposed to be triggered by any keyboard or only
> the dock one?
>

Any keyboard. Dock keyboard is basically a regular keyboard fused with
a multimedia top row.

> Thanks.
>
> --
> Dmitry

