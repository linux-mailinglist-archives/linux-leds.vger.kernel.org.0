Return-Path: <linux-leds+bounces-8235-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8PQABiMNDmo35wUAu9opvQ
	(envelope-from <linux-leds+bounces-8235-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 21:36:03 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6339C5987A8
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 21:36:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A885535D4DFA
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 16:32:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D6EC31E83D;
	Wed, 20 May 2026 16:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GsT4DFcB"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B85436404E
	for <linux-leds@vger.kernel.org>; Wed, 20 May 2026 16:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779294647; cv=pass; b=USQR/h1Bbmd5aI+MT1mpiCMTZmWeoUXvBablcb1qncpO9xuf8luqp/BTJBcGW48VrJN4WLnX7ZQ4tfADlmCIp2/sBhM8DEY9QPFkn4QgvforMb4SMq8FLN2L9R3dAbI5BiKwbZfgxf77WntVan9aTInbkbcQL/rLZSziVccYPuk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779294647; c=relaxed/simple;
	bh=lqFBKQb+Gdpn+xtwjBFEch2E3UDsPsxKMgztcPJtks8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RjDsCdlKvN5iCRtJRG6Djm7hllc7DDpwaOsuG16gvxjr/Dxw90uP4yWTBmF+VZHkjyO1RJezYb1bU3YV7h/IJo4lkaTtVi3RJ7rlMcF/owOMi3ghnHKnoWJrf+UoqJZIIYERpfXU5Mh+8zG8V3Z5lfmjDmcR75E2BrKhXmXrFqU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GsT4DFcB; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3042a388168so101592eec.1
        for <linux-leds@vger.kernel.org>; Wed, 20 May 2026 09:30:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779294644; cv=none;
        d=google.com; s=arc-20240605;
        b=JttsXnXwK/yAgowYYPDtRpkwDKA1R6NO0FaEk0/MycOg1wK3c/iccDrEgZpYJPDkC8
         2zzmte9jFu5YMcu0lLbxVHdBWBKQVPDNRAgsyF+QgLkn19HUoUk2FM1nS47qM9BuvmNS
         aa4NJpebr3yZOutrxKG0Phe+Y/CjgtK6/fdsws2qveWzmia66vC2JhBhnJufqMroQjxe
         f2GhLAAydB8kj2+pwu30j3ZyZf49RslxHvTA/0GKwPm0nr6CARSubaywowQeRKmgfBbq
         W3gJY9i5dtFwwovu2BYVmzAxb40NMcheZVN1AJlsV3IlPlOWsPWuJ2PlAqnfbihalNWi
         mhig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b+JhhmILz9tlrVY7OUaZADi1RQEkDpXxHbma3Cjgx2o=;
        fh=AijB00nS/gkRHvOHOEYJDc0SnhV9Rgl3zxUtQqw0dRY=;
        b=NVnX6vIrjZy+QmYJTNDOTqXgOBbXxKY/467/NP0IK9XK3EN+CijmxTH+otRpKenkvd
         Yy0CZnWeNByB7ov1VSqmZ/fdXTqV+hkdaW94PFReV9qydlsRBRItm/BD4q86P/3VZ+aj
         aFXVvbwYXnNSZizQ305I+YUxq83mUxC6EmJcHCl74+8XghZWKZVd+uVEwXiIkqKNHQjk
         E6g0vDJLyexH9KqMS7wsLGt/qn18+tYjk2cdXhB9top54xom9Eb7cNQtiC008lWruC8C
         m2JJNxYBNkjmcI2+MGGiCaGgBgu+ZlBbZpVlDekNN7dIJ504t7iHz9v8Xix9z/kAnNIR
         +q/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779294644; x=1779899444; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b+JhhmILz9tlrVY7OUaZADi1RQEkDpXxHbma3Cjgx2o=;
        b=GsT4DFcBQgp80xs1xENIvwYc2WOm8v7zjQq/LF08lflb23Pk9qvyjJTGlTfhvqhGrm
         jdJ1LvS4D7uUsu3k35K6+ttEST+hhIY96mKx/uwde0Kc6zbbIzVp368cpbOqa9SkWcYY
         /cVCjNhJcoJ3q72++496ROxA1wKyQSdqqEn7plfo2a1GW/Cpteie71ogQq/xbazrI7pQ
         1T+E3FHNFl+X6q8WR2fIRwyzNepd0sNb6nnI41Ev719nlqiEfnG9fzsmFaC/E1chb7JV
         /rBa9+0GlHXmtWnIzkm0JpZHo7YZlAsRdtrEyqMTVOR5/ez774WkCukHDOWPrIldCVYO
         gBXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779294644; x=1779899444;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b+JhhmILz9tlrVY7OUaZADi1RQEkDpXxHbma3Cjgx2o=;
        b=kQ2lcya9knmSMsdJA/yHSiGk9YVC0UrBVyccNZVY4hEKAZ2dsNEOUTubVBx+2S/I1a
         uNWc+6vCnrajtO6hdamsUxkDwqdipzH38xM2Mt4Mn8U7IrztobeD0tA+YSL3yVZUPAMF
         NEG5/bPx7eMIRKDtfbkPBvp7lHsRhW5LVQooWSFa/g0GXml1po2E2NIAv68juILX3q9m
         JpARc2oBRqotUA6xy8X04aI8et2/L2acxCyKwOqPsbuXYh2dw2HLEZ2ccBMWukis7s9g
         cuu2RdJfk3jjy2C7QuNpYVqq+0inLgufd7DoZ2W+cwaKgE3iT7UUajpT/OOQDbM0qUjZ
         leWA==
X-Forwarded-Encrypted: i=1; AFNElJ9za85/QMpbhL7MKzBn5vNAR1Yx9uFKKolXCYyx+GdTsxLOGYGMz6ncbpLnyBrAQFmYh+Cd75kQu4XU@vger.kernel.org
X-Gm-Message-State: AOJu0YyyLorbhN9UUY4Oii93kTLr3lxip9mJKhsMbLfPG9HdecVW6Kcw
	givsZ5B3/Cn1/e3+a50J3jl5Kt986bzkwDKeHGiIrC0m5Vx+UiCvn+CDFdGorG5pEjqu5MwFIrw
	4cl8ZgjEInrfsvYvfvGNYJY+S5+xZ1+I=
X-Gm-Gg: Acq92OGlQSEqy7X7OrNExHaOclieBwdmToV2o9J2vREGbHmEdzLwLsLuiBQ97G8Yzeb
	jESbtaEn9YEeDezm+vtvjWVTthH/VjXwvVeUGTRmQscQYGI45g1Uj/uJ0DlFljO0pyzVgbwYRqh
	wfTwZZwdLMgtGHwO9A75pY7Y3qH/VHCjfeZXoYbVBOFb+qQX20ptygDp/XCtHUBfwWLGjxhDhVv
	cv9/fhxiJu5jkmBUAI5L0TJa9XxVGonzUChsNW9Kki/gaZ1GDz3Zb/9WaNLNL+3vtCijBc2LxWK
	otmD6FKY+55Tmw5ObQo=
X-Received: by 2002:a05:7300:430d:b0:2d9:db50:c6ce with SMTP id
 5a478bee46e88-3042b30f58emr133987eec.3.1779294644194; Wed, 20 May 2026
 09:30:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260510110804.33045-1-clamor95@gmail.com> <20260510110804.33045-6-clamor95@gmail.com>
 <20260520150758.GG2767592@google.com> <CAPVz0n0t4PXfmgWYQ1vSTFwfg=+g4oGU+-dwgnBVKxUoUwHGqw@mail.gmail.com>
 <20260520160548.GK2767592@google.com>
In-Reply-To: <20260520160548.GK2767592@google.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 20 May 2026 19:30:33 +0300
X-Gm-Features: AVHnY4JmTvba-tTOAJoJtR9Zh7F3ke9BpWduNjiTbbw6Iohr70Fgqlb_QaNL6ZQ
Message-ID: <CAPVz0n2s32uYP76R9VNtWYnHrDQJKK+qC1uRRdkaX1ekF15Pww@mail.gmail.com>
Subject: Re: [PATCH v5 5/6] mfd: motorola-cpcap: diverge configuration per-board
To: Lee Jones <lee@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Tony Lindgren <tony@atomide.com>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8235-lists,linux-leds=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,baylibre.com,atomide.com,vger.kernel.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 6339C5987A8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

=D1=81=D1=80, 20 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 19:0=
5 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, 20 May 2026, Svyatoslav Ryhel wrote:
>
> > =D1=81=D1=80, 20 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE =
18:08 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Sun, 10 May 2026, Svyatoslav Ryhel wrote:
> > >
> > > > MFD have rigid subdevice structure which does not allow flexible dy=
namic
> > > > subdevice linking. Address this by diverging CPCAP subdevice compos=
ition
> > > > to take into account board specific configuration.
> > > >
> > > > Create a common default subdevice composition, rename existing subd=
evice
> > > > composition into cpcap_mapphone_mfd_devices since it targets mainly
> > > > Mapphone board.
> > > >
> > > > Removed st,6556002 as it is no longer applicable to all cases and
> > > > duplicates motorola,cpcap, which is used as the default composition=
.
> > > >
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > ---
> > > >  drivers/mfd/motorola-cpcap.c       | 142 ++++++++++++++++---------=
----
> > > >  include/linux/mfd/motorola-cpcap.h |   6 ++
> > > >  2 files changed, 87 insertions(+), 61 deletions(-)
> > >
> > > Looking much better, thanks.
> > >
> > > Nit: A patch-level changelog really is much more helpful to reviewers=
.
> > >
> >
> > Noted, but I will not guarantee that I will do patch-level changelogs, =
sorry.
>
> That's fine.  All I can do is ask.
>
> Note that, helping out reviewers usually ends up helping you too.
>
> [...]
>
> > > > +static const struct mfd_cell cpcap_default_mfd_devices[] =3D {
> > > > +     MFD_CELL_OF("cpcap_adc", NULL, NULL, 0, 0, "motorola,cpcap-ad=
c"),
> > > > +     MFD_CELL_OF("cpcap_battery", NULL, NULL, 0, 0,
> > > > +                 "motorola,cpcap-battery"),
> > > > +     MFD_CELL_OF("cpcap-regulator", NULL, NULL, 0, 0,
> > > > +                 "motorola,cpcap-regulator"),
> > > > +     MFD_CELL_OF("cpcap-rtc", NULL, NULL, 0, 0, "motorola,cpcap-rt=
c"),
> > > > +     MFD_CELL_OF("cpcap-pwrbutton", NULL, NULL, 0, 0,
> > > > +                 "motorola,cpcap-pwrbutton"),
> > > > +     MFD_CELL_OF("cpcap-usb-phy", NULL, NULL, 0, 0,
> > > > +                 "motorola,cpcap-usb-phy"),
> > > > +     MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 0, "motorola,cpcap-le=
d-red"),
> > > > +     MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 1, "motorola,cpcap-le=
d-green"),
> > > > +     MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 2, "motorola,cpcap-le=
d-blue"),
> > > > +     MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 3, "motorola,cpcap-le=
d-adl"),
> > > > +     MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 4, "motorola,cpcap-le=
d-cp"),
> > > > +     MFD_CELL_NAME("cpcap-codec"),
> > > > +};
> > >
> > > Nit: I wouldn't complain if you wanted to have all of these on a sing=
le
> > > line for neatness.
> > >
> >
> > Noted
> >
> > > > +static const struct mfd_cell cpcap_mapphone_mfd_devices[] =3D {
> > > > +     MFD_CELL_OF("cpcap_adc", NULL, NULL, 0, 0,
> > > > +                 "motorola,mapphone-cpcap-adc"),
> > > > +     MFD_CELL_OF("cpcap_battery", NULL, NULL, 0, 0,
> > > > +                 "motorola,cpcap-battery"),
> > > > +     MFD_CELL_OF("cpcap-charger", NULL, NULL, 0, 0,
> > > > +                 "motorola,mapphone-cpcap-charger"),
> > > > +     MFD_CELL_OF("cpcap-regulator", NULL, NULL, 0, 0,
> > > > +                 "motorola,mapphone-cpcap-regulator"),
> > > > +     MFD_CELL_OF("cpcap-rtc", NULL, NULL, 0, 0, "motorola,cpcap-rt=
c"),
> > > > +     MFD_CELL_OF("cpcap-pwrbutton", NULL, NULL, 0, 0,
> > > > +                 "motorola,cpcap-pwrbutton"),
> > > > +     MFD_CELL_OF("cpcap-usb-phy", NULL, NULL, 0, 0,
> > > > +                 "motorola,mapphone-cpcap-usb-phy"),
> > > > +     MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 0, "motorola,cpcap-le=
d-red"),
> > > > +     MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 1, "motorola,cpcap-le=
d-green"),
> > > > +     MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 2, "motorola,cpcap-le=
d-blue"),
> > > > +     MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 3, "motorola,cpcap-le=
d-adl"),
> > > > +     MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 4, "motorola,cpcap-le=
d-cp"),
> > > > +     MFD_CELL_NAME("cpcap-codec"),
> > > >  };
> > >
> > > A lot of these are duplicated, right?
> > >
> > > I would have a comment set, then the differences in separate containe=
rs.
> >
> > It may be impossible to predict a generic setup since some devices may
> > require unique compatibles, other may not have LEDs, third may be
> > partially incompatible with existing cells. In other mfd cases
> > creating a generic bundle might be good, but in this case I would
> > suggest better to keep these separate entirely per-device. They will
> > not take much space, nor add confusion with these macros.
>
> I'm not sure we're understanding each other.  Let me give you an example:
>
> static const struct mfd_cell cpcap_common_devices[] =3D {
>      MFD_CELL_OF("cpcap_battery", NULL, NULL, 0, 0, "motorola,cpcap-batte=
ry"),
>      MFD_CELL_OF("cpcap-rtc", NULL, NULL, 0, 0, "motorola,cpcap-rtc"),
>      MFD_CELL_OF("cpcap-pwrbutton", NULL, NULL, 0, 0, "motorola,cpcap-pwr=
button"),
>      MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 0, "motorola,cpcap-led-red")=
,
>      MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 1, "motorola,cpcap-led-green=
"),
>      MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 2, "motorola,cpcap-led-blue"=
),
>      MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 3, "motorola,cpcap-led-adl")=
,
>      MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 4, "motorola,cpcap-led-cp"),
>      MFD_CELL_NAME("cpcap-codec"),
> };
>
> static const struct mfd_cell cpcap_default_devices[] =3D {
>      MFD_CELL_OF("cpcap_adc", NULL, NULL, 0, 0, "motorola,cpcap-adc"),
>      MFD_CELL_OF("cpcap-regulator", NULL, NULL, 0, 0, "motorola,cpcap-reg=
ulator"),
>      MFD_CELL_OF("cpcap-usb-phy", NULL, NULL, 0, 0, "motorola,cpcap-usb-p=
hy"),
> };
>
> static const struct mfd_cell cpcap_mapphone_devices[] =3D {
>      MFD_CELL_OF("cpcap_adc", NULL, NULL, 0, 0, "motorola,mapphone-cpcap-=
adc"),
>      MFD_CELL_OF("cpcap-charger", NULL, NULL, 0, 0, "motorola,mapphone-cp=
cap-charger"),
>      MFD_CELL_OF("cpcap-regulator", NULL, NULL, 0, 0, "motorola,mapphone-=
cpcap-regulator"),
>      MFD_CELL_OF("cpcap-usb-phy", NULL, NULL, 0, 0, "motorola,mapphone-cp=
cap-usb-phy"),
> };
>
> This way, it's super easy to read / maintain the common and unique device=
s.
>
> The only potential drawback would be 2 calls to mfd_add_devices() but
> that's common practice.
>
> Also notice that I droped the "_mfd" parts, which you should too.
>

What if next added device does not have cpcap-battery, cpcap-led-adl,
cpcap-pwrbutton, uses external codec and would require cpcap-watchdog
which is not yet present. This will cause issues. Even Mot introduces
in the last patch of this patchset has slightly different composition.

> > > >  static int cpcap_probe(struct spi_device *spi)
> > > >  {
> > > >       struct cpcap_ddata *cpcap;
> > > > +     const struct mfd_cell *cells;
> > > > +     unsigned int num_cells;
> > > >       int ret;
> > > >
> > > >       cpcap =3D devm_kzalloc(&spi->dev, sizeof(*cpcap), GFP_KERNEL)=
;
> > > >       if (!cpcap)
> > > >               return -ENOMEM;
> > > >
> > > > +     cpcap->variant =3D (enum cpcap_variant)spi_get_device_match_d=
ata(spi);
> > > > +     if (!cpcap->variant)
> > > > +             return -ENODEV;
> > >
> > > Isn't this covered in the 'default' below?
> > >
> >
> > This is for case cpcap->variant =3D 0, it should never happen, but chec=
k
> > will not cause harm
>
> The 'default' branch in the switch below will pick that up too.  This
> check is superfluous.
>

Noted

> > > > +     switch (cpcap->variant) {
> > > > +     case CPCAP_DEFAULT:
> > > > +             cells =3D cpcap_default_mfd_devices;
> > > > +             num_cells =3D ARRAY_SIZE(cpcap_default_mfd_devices);
> > > > +             break;
> > > > +     case CPCAP_MAPPHONE:
> > > > +             cells =3D cpcap_mapphone_mfd_devices;
> > > > +             num_cells =3D ARRAY_SIZE(cpcap_mapphone_mfd_devices);
> > > > +             break;
> > > > +     default:
> > > > +             return dev_err_probe(&spi->dev, -EINVAL,
> > > > +                                  "Unknown device %d\n", cpcap->va=
riant);
> > >
> > > This should be -ENODEV.
> > >
> >
> > hm, match is ENODEV cause it looks for device, here driver checks
> > id/variant, so shouldn't it be EINVAL? I assume error message should
> > be "Unknown device version" or "Unknown device ID"
>
> All of your supported devices are represented in this switch statement.
> Any other request, regardless of the reason should results in
> "Unsupported device" and a -ENODEV - same as your check for
> !cpcap->variant above.
>

Noted

> --
> Lee Jones

