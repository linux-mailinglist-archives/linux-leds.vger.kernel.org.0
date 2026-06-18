Return-Path: <linux-leds+bounces-8661-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rjYrGaHqM2qQIQYAu9opvQ
	(envelope-from <linux-leds+bounces-8661-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 14:54:57 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id F08F96A036F
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 14:54:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=hJy5wH0J;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8661-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-leds+bounces-8661-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 67C74300D768
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 12:54:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 203143F23AF;
	Thu, 18 Jun 2026 12:54:55 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708F03845CD
	for <linux-leds@vger.kernel.org>; Thu, 18 Jun 2026 12:54:53 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781787295; cv=pass; b=mKYHtnQ/wsNgATA1Dxr4tnvvlmnsEFfz4Xv9fmJUpSJu5hXRG+YZBYGSQuiXMb2fk9kxWh+4NUrNEOTpnGXlBM6BCbNnURCLPaLNeXzeZAV2TH8MDrqK3EPtTjEIzQz6gXuiKMAGYzPTSEMiGPRKfhZXTifowvOGZ7ycQIZxkIc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781787295; c=relaxed/simple;
	bh=J7eeWyqbGcyQ83kRIeqIYu9zZpto9qa/3uEOVb05eGw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lCW6vICNKjqbyymw2yxvpeKMtWCyCGWVTpk7MErPp/rQArM9M9POYhrkBmn1iuFeI44K22ZGffvVvJ6EElo/AM8veC7GkmQ/h0j7lrAh9gVy53ncavCvyjQTOz+me3ozaVTQHNVxNXLBr2dIOVYQo2fKd4ObPwckD8z6B6mA248=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hJy5wH0J; arc=pass smtp.client-ip=74.125.82.175
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-30bbe98c3f0so747986eec.0
        for <linux-leds@vger.kernel.org>; Thu, 18 Jun 2026 05:54:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781787292; cv=none;
        d=google.com; s=arc-20240605;
        b=Nh6Gf716vKmPjuQv0iL1EbcE5HxzH7L/RFB78fqWA4tWHFkYtYBQBq4RWrRtpiMzBN
         OSE6GLIbWpBEnPsYrm/7z5sm2rHiOzC0DIStKBSsANOuuDDOSrHa4qi4zhYZKwyg72dU
         TagEA5acK0JgREwtYlP5V5QR33L2sY159MydWZIgXO14NRhqRPaYddLt+eP/wQRTJygG
         AhEmhdI16LoC+Te1GyNrDHWFkpETmDlOxug83Do/TM7RtGl0zG1dHPRnbeVRlm2Vf3RP
         3QSCCwGjdmLzDbko3wiKSbiGAkaiCitVlWkKuEsl05KlvZ1tdLyrL/nRMbs/6rkShA3L
         hRIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TCZ2aNL11hbP4R4kkuDPj9FfQ/WKus/j+epI04FrrLM=;
        fh=tBy01Fcro6q57zNeIKh/APpSQc6S458dCHcPTwRQ8dY=;
        b=TG+1Cltxpj1C/H0gghwfFccGwFB0u+uiT9coLQc9y5yMmtRfpa5BcpkjeIV0QQAC4c
         K37kl0HNZK8q4P6Fjxh6CzvZCSl8ZsYU4PYFxXARMqjdL2zRUgtrbD49zijfo/LYgD3d
         2fnY2k7I8dLPjRfwkMyidqwumAt36+RMD9zl2bsm08qmttDIQcDknHJiFeGcSPzCauyX
         v9TXZGsQgjVbwLRD2F+QsFsdAfTZdYCdI3yPvfHM2trXbr44FxvykWblRFQoqRv0fJVR
         twlQomXZSYN0UZkjuGJYDjOPaAPHZL07nkrR6zJ71QYcc2Ns2BmDhopG2OH3rJOROg7l
         c6jg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781787292; x=1782392092; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TCZ2aNL11hbP4R4kkuDPj9FfQ/WKus/j+epI04FrrLM=;
        b=hJy5wH0JUl3DgQQXDNw/4JEpQa/D8t5EiFqXSuau9gq9K5KY+LEXa2R33bjjw5p8l2
         E/pqcPtSbmxnu2rHTkka7GpMnOoHgEEZirOA0kZdgS7wIHFPBGh84K9BHKaPKGpGTbcR
         F5ArIeqG41vW5iYw1in+X7zGprR92MzdBvi0+erJBAZueS7YAR02h1d3MKpxoKNr4mS4
         4PVfhiiNQ17XEbs3GcJ44VVUocWWiQ8juHHfYInXY73jJ4mPE7Mn/eM3ZRFTjkeuJDQC
         BLGqcHVRXlwibsrXXj+ylzIyGfjYFS4rM3c8tOQbqjgfq3ALxU4ctfY8l0fCh17kE9ZL
         Igbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781787292; x=1782392092;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TCZ2aNL11hbP4R4kkuDPj9FfQ/WKus/j+epI04FrrLM=;
        b=Ocjlgp/jaJUsk4sXbVW4M28OMsJYyDLJqQaSm4/RkZewJXEzdq56EmtTSOEYcQqWYl
         MJxwyDci4mSgaZ7G3n+yFAgj5YRujDiDZvLboM1RC67ZOP1DMCr397L690/SYG7t2p0Z
         CTRjRteMEmQTXu/Sb4zynWkL78kB1WhQUhznkaoQf2ffcl9kxyYbbaMCGNRuC58YXMFv
         FLZgXDNDfJdv76xMTMxjGUxRVi/DQOjlZPflFBrPRIagym6d0NRSZoSikQ10IZVhR5uF
         BF53SH+inoogwitsJHmjYxJ/DB0Y1AY3+a+SOGw+BDWAdpDZeiKMPBWXwD7nANUYKKXr
         9U9w==
X-Forwarded-Encrypted: i=1; AFNElJ9JYXy2Fi6vAsFOhlp/3+tGeplTrjtrgJSjjHDX6JdkuNkmuhBYTtuk+M5DIPq0NPliHULiRkRhj2it@vger.kernel.org
X-Gm-Message-State: AOJu0YydL+Hvv6VjookIQnGZcXs4UlLVXYYrH6sR1JxOjksaG3pMTMo/
	3h4eIb6gKhKZWTnhaIu7rG+adPX3TVu1NYMTkehYMq+AYRdwEvUJ6HcE2wrQ74CC/PQSUxibFWP
	Q8XcDJ3qQfslImcS0D82hoEYXzzXpfX4=
X-Gm-Gg: AfdE7cnMavOlDEnoau/zS20iyniVQWF6b0dDwXn/87PeKRAu5WQlpMybT6Dgmesmgv1
	pZD0RcAdR88x/XqxBbmkY1PY4tjrvyeat3NSIm7jrSZ/zu0w2sP+4A2o6PkL90sTCdA1cO9fsl1
	WonCGYEH5sd5bymZzwPvyNrYcvdkDnNXK/0lhcK+hMNYcvOvv8XWQSd5QJuRextqdL1VkyvpSGI
	xsh25/jaiWxl5KjUWaD4o6Ii/DpdokWOAEZti5CLcJ90xEBGhenm3GliT2e6JwbcIapWFbckw==
X-Received: by 2002:a05:7301:1298:b0:30b:ab02:9e52 with SMTP id
 5a478bee46e88-30bca0f5296mr4761901eec.30.1781787292416; Thu, 18 Jun 2026
 05:54:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528053203.9339-1-clamor95@gmail.com> <20260528053203.9339-3-clamor95@gmail.com>
 <20260611111732.GN4151951@google.com> <CAPVz0n0caBBt6A+AFeUpGdxvb3Qhoui7khLCt3747bPUKmMXhQ@mail.gmail.com>
 <20260618122605.GH1672911@google.com>
In-Reply-To: <20260618122605.GH1672911@google.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 18 Jun 2026 15:54:40 +0300
X-Gm-Features: AVVi8CfTnDAfpuPP0d_Z_jltkx8Vj-c5slqF9qsZ7cxFL8qnNDx9bMszb50n8ZE
Message-ID: <CAPVz0n3ZiWVLstiZat7-Tp06G_Tji=d_C45V8iqO4PgH9zfj+Q@mail.gmail.com>
Subject: Re: [PATCH v8 2/7] mfd: Add driver for ASUS Transformer embedded controller
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Pavel Machek <pavel@kernel.org>, Sebastian Reichel <sre@kernel.org>, Ion Agorria <ion@agorria.com>, 
	=?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:dmitry.torokhov@gmail.com,m:pavel@kernel.org,m:sre@kernel.org,m:ion@agorria.com,m:mirq-linux@rere.qmqm.pl,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-input@vger.kernel.org,m:linux-leds@vger.kernel.org,m:linux-pm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-8661-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,agorria.com,rere.qmqm.pl,vger.kernel.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F08F96A036F

=D1=87=D1=82, 18 =D1=87=D0=B5=D1=80=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 15:2=
6 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thu, 11 Jun 2026, Svyatoslav Ryhel wrote:
>
> > =D1=87=D1=82, 11 =D1=87=D0=B5=D1=80=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE =
14:17 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Thu, 28 May 2026, Svyatoslav Ryhel wrote:
> > > > From: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> > > >
> > > > Support Nuvoton NPCE795-based ECs as used in Asus Transformer TF201=
,
> > > > TF300T, TF300TG, TF300TL and TF700T pad and dock, as well as TF101 =
dock
> > > > and TF600T, P1801-T and TF701T pad. This is a glue driver handling
> > > > detection and common operations for EC's functions.
> > > >
> > > > Co-developed-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > Signed-off-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> > > > ---
> > > >  drivers/mfd/Kconfig                     |  16 +
> > > >  drivers/mfd/Makefile                    |   1 +
> > > >  drivers/mfd/asus-transformer-ec.c       | 542 ++++++++++++++++++++=
++++
> > > >  include/linux/mfd/asus-transformer-ec.h |  92 ++++
> > > >  4 files changed, 651 insertions(+)
> > > >  create mode 100644 drivers/mfd/asus-transformer-ec.c
> > > >  create mode 100644 include/linux/mfd/asus-transformer-ec.h
>
> [...]
>
> > > > +static void asus_ec_clear_buffer(struct asus_ec_data *ddata)
> > > > +{
> > > > +     int ret, retry =3D ASUSEC_RSP_BUFFER_SIZE;
> > > > +
> > > > +     /*
> > > > +      * Read the buffer till we get valid data by checking ASUSEC_=
OBF_MASK
> > > > +      * of the status byte or till we reach end of the 256 byte bu=
ffer.
> > > > +      */
> > > > +     while (retry--) {
> > > > +             ret =3D i2c_smbus_read_i2c_block_data(ddata->client, =
ASUSEC_READ_BUF,
> > > > +                                                 ASUSEC_ENTRY_SIZE=
,
> > > > +                                                 ddata->ec_buf);
> > > > +             if (ret < ASUSEC_ENTRY_SIZE)
> > > > +                     continue;
> > > > +
> > > > +             if (ddata->ec_buf[ASUSEC_IRQ_STATUS] & ASUSEC_OBF_MAS=
K)
> > > > +                     continue;
> > > > +
> > > > +             break;
> > > > +     }
> > > > +}
> > > > +
> > > > +static int asus_ec_log_info(struct asus_ec_data *ddata, unsigned i=
nt reg,
> > > > +                         const char *name, const char **out)
>
> If we can avoid points to pointers, then please do.
>
> We already have ddata, so we can just set the name?
>
> It will remove a lot of the following complexity / ugliness.
>
> > > > +{
> > > > +     struct device *dev =3D &ddata->client->dev;
> > > > +     u8 buf[ASUSEC_ENTRY_BUFSIZE];
> > > > +     int ret;
> > > > +
> > > > +     memset(buf, 0, ASUSEC_ENTRY_BUFSIZE);
> > > > +     ret =3D i2c_smbus_read_i2c_block_data(ddata->ec.dockram, reg,
> > > > +                                         ASUSEC_ENTRY_SIZE, buf);
> > > > +     if (ret < ASUSEC_ENTRY_SIZE)
> > > > +             return ret;
> > >
> > > Same here.  These should be negative.
> > >
> >
> > return ret < 0 ? ret : -EIO same as above
> >
> > > > +
> > > > +     if (buf[0] > ASUSEC_ENTRY_SIZE) {
> > > > +             dev_err(dev, "bad data len; buffer: %*ph; ret: %d\n",
> > > > +                     ASUSEC_ENTRY_BUFSIZE, buf, ret);
> > > > +             return -EPROTO;
> > > > +     }
> > > > +
> > > > +     if (!ddata->logging_disabled) {
> > > > +             dev_info(dev, "%-14s: %.*s\n", name, buf[0], buf + 1)=
;
> > > > +
> > > > +             if (out) {
> > > > +                     *out =3D devm_kasprintf(dev, GFP_KERNEL, "%.*=
s",
> > > > +                                           buf[0], buf + 1);
> > > > +                     if (!*out)
> > > > +                             return -ENOMEM;
> > > > +             }
> > > > +     }
> > >
> > > FWIW, I hate this!  What does it give you now that development is don=
e?
> > >
> >
> > We have already discussed this, and you agreed that EC and firmware
> > prints may stay! This prints EC model and firmware info as well as EC
> > firmware behavior. It allows identify possible new revisions of EC -
> > Firmware combo and address possible regressions (check if it is chip
> > malfunction or firmware needs a new programming model) without
> > rebuilding kernel and digging downstream kernel for needed bits of
> > code.
>
> Right, so just print it out and remove all of the 'logging_disabled' and
> 'out' nonsense.
>
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +static int asus_ec_reset(struct asus_ec_data *ddata)
> > > > +{
> > > > +     int retry, ret;
> > > > +
> > > > +     guard(mutex)(&ddata->ecreq_lock);
> > > > +
> > > > +     for (retry =3D 0; retry < ASUSEC_RETRY_MAX; retry++) {
> > >
> > > for (int retry =3D ... is generally preferred for throwaway variables=
.
> > >
> >
> > Not that I care too much, but I am defining ret anyway, why not add
> > retry too there?
>
> This is the new and preferred way to use throw-away variables.
>
> ret is not a throw-away variable.
>
> [...]
>
> > > > +static int asus_ec_set_factory_mode(struct asus_ec_data *ddata,
> > > > +                                 enum asusec_mode fmode)
> > > > +{
> > > > +     dev_info(&ddata->client->dev, "Entering %s mode.\n",
> > > > +              fmode =3D=3D ASUSEC_MODE_FACTORY ? "factory" : "norm=
al");
> > > > +
> > > > +     return asus_dockram_access_ctl(ddata->ec.dockram, NULL,
> > > > +                                    ASUSEC_CTL_FACTORY_MODE,
> > > > +                                    fmode =3D=3D ASUSEC_MODE_FACTO=
RY ?
> > > > +                                    ASUSEC_CTL_FACTORY_MODE : 0);
> > >
> > > Why not create make:
> > >
> > > ASUSEC_MODE_FACTORY =3D=3D ASUSEC_CTL_FACTORY_MODE
> > >
> > > What happens to NORMAL?
> > >
> >
> > ASUSEC_CTL_FACTORY_MODE is a bit in the ctl register. For NORMAL mode
>
> I get that, but if the values can be shared, it make the code simpler.
>
> > bit is cleared,
> > for FACTORY bit it set, for NONE bit is ignored.
> >
> > > > +}
> > > > +
> > > > +static int asus_ec_detect(struct asus_ec_data *ddata)
> > > > +{
> > > > +     int ret;
> > > > +
> > > > +     ret =3D asus_ec_reset(ddata);
> > > > +     if (ret)
> > > > +             goto err_exit;
> > > > +
> > > > +     asus_ec_clear_buffer(ddata);
> > > > +
> > > > +     ret =3D asus_ec_log_info(ddata, ASUSEC_DOCKRAM_INFO_MODEL, "M=
odel",
> > > > +                            &ddata->ec.model);
>
> Where is this model used?
>

Model is passed to cells to form names, particularly input device names.

> > > You can use 100-chars and make the code look beautiful! :)
> > >
> >
> > Not every subsystem permits 100 chars, some stick to 80 as a strict
> > rule, so it is better be safe.
>
> Right, but we are forward thinking here.
>
> You can and should use 100-chars in this subsystem.
>
> > > > +     if (ret)
> > > > +             goto err_exit;
> > > > +
> > > > +     ret =3D asus_ec_log_info(ddata, ASUSEC_DOCKRAM_INFO_FW, "FW v=
ersion",
> > > > +                            NULL);
> > > > +     if (ret)
> > > > +             goto err_exit;
> > > > +
> > > > +     ret =3D asus_ec_log_info(ddata, ASUSEC_DOCKRAM_INFO_CFGFMT, "=
Config format",
> > > > +                            NULL);
> > > > +     if (ret)
> > > > +             goto err_exit;
> > > > +
> > > > +     ret =3D asus_ec_log_info(ddata, ASUSEC_DOCKRAM_INFO_HW, "HW v=
ersion",
> > > > +                            NULL);
> > > > +     if (ret)
> > > > +             goto err_exit;
> > > > +
> > > > +     /* Disable logging on next EC request */
> > >
> > > Why, but why?
> > >
> >
> > Cause EC requests are frequent (handshake/reset) and constant logging
> > same data is not acceptable.
>
> Then rid the prints entirely or do them at a more appropriate point like
> during probe?
>
> Or maybe consider dev_info_once() and friends.
>

I totally forgot about dev_info_once(), thank you.

> > > > +     ddata->logging_disabled =3D true;
> > > > +
> > > > +     /* Check and inform about EC firmware behavior */
> > > > +     ret =3D asus_ec_susb_on_status(ddata);
> > > > +     if (ret)
> > > > +             goto err_exit;
> > > > +
> > > > +     ddata->ec.name =3D ddata->info->name;
> > > > +
> > > > +     /* Some EC require factory mode to be set normal on each requ=
est */
> > > > +     if (ddata->info->fmode)
> > > > +             ret =3D asus_ec_set_factory_mode(ddata, ddata->info->=
fmode);
> > > > +
> > > > +err_exit:
> > > > +     if (ret)
> > > > +             dev_err(&ddata->client->dev, "failed to access EC: %d=
\n", ret);
> > > > +
> > > > +     return ret;
> > > > +}
> > > > +
> > > > +static void asus_ec_handle_smi(struct asus_ec_data *ddata, unsigne=
d int code)
> > > > +{
> > > > +     switch (code) {
> > > > +     case ASUSEC_SMI_HANDSHAKE:
> > > > +     case ASUSEC_SMI_RESET:
> > > > +             asus_ec_detect(ddata);
> > > > +             break;
> > > > +     }
> > > > +}
> > > > +
> > > > +static irqreturn_t asus_ec_interrupt(int irq, void *dev_id)
> > > > +{
> > > > +     struct asus_ec_data *ddata =3D dev_id;
> > > > +     unsigned long notify_action;
> > > > +     int ret;
> > > > +
> > > > +     ret =3D i2c_smbus_read_i2c_block_data(ddata->client, ASUSEC_R=
EAD_BUF,
> > > > +                                         ASUSEC_ENTRY_SIZE, ddata-=
>ec_buf);
> > > > +     if (ret < ASUSEC_ENTRY_SIZE ||
> > > > +         !(ddata->ec_buf[ASUSEC_IRQ_STATUS] & ASUSEC_OBF_MASK))
> > >
> > > Unwrap for readability.
> > >
> > > Also, I think a comment would be helpful.
> > >
> >
> > if (ret < ASUSEC_ENTRY_SIZE)
> >     return IRQ_NONE;
> >
> > ret =3D ddata->ec_buf[ASUSEC_IRQ_STATUS] & ASUSEC_OBF_MASK;
> > if (!ret)
> >     return IRQ_NONE;
> >
> > This would be acceptable? (I will add comments later on)
>
> Yes, better.
>
> If you're not using ret again, you could just put 'ddata.." inside the if=
().
>

I thought about this, but that would require combining it with (!)
which will not help with readabilty.

> > > > +             return IRQ_NONE;
> > > > +
> > > > +     notify_action =3D ddata->ec_buf[ASUSEC_IRQ_STATUS];
> > > > +     if (notify_action & ASUSEC_SMI_MASK) {
> > > > +             unsigned int code =3D ddata->ec_buf[ASUSEC_SMI_CODE];
> > > > +
> > > > +             asus_ec_handle_smi(ddata, code);
> > > > +
> > > > +             notify_action |=3D code << 8;
> > > > +     }
> > > > +
> > > > +     blocking_notifier_call_chain(&ddata->ec.notify_list,
> > > > +                                  notify_action, ddata->ec_buf);
> > > > +
> > > > +     return IRQ_HANDLED;
> > > > +}
> > > > +
> > > > +static void asus_ec_release_dockram_dev(void *client)
> > > > +{
> > > > +     i2c_unregister_device(client);
> > > > +}
> > > > +
> > > > +static struct i2c_client *devm_asus_dockram_get(struct device *dev=
)
> > > > +{
> > > > +     struct i2c_client *parent =3D to_i2c_client(dev);
> > > > +     struct i2c_client *dockram;
> > > > +     struct dockram_ec_data *ddata;
> > > > +     int ret;
> > > > +
> > > > +     dockram =3D i2c_new_ancillary_device(parent, "dockram",
> > > > +                                        parent->addr + 2);
> > >
> > > Could we define a macro for the address offset '2' here to avoid usin=
g a magic
> > > number?
> > >
> >
> > It seems that you are excessively concerned with "magic numbers".
>
> Bingo!  I HATE magic numbers.
>
> https://lore.kernel.org/all/?q=3D%22Lee+Jones%22+magic
>
> ~900 messages!  =3D:-D
>

AHAHAH, ok, this makes things clearer. Lemmy have a note about this quirk.

> [...]
>
> > > > +static const struct asus_ec_chip_info asus_ec_tf600t_pad_data =3D =
{
> > > > +     .name =3D "pad",
> > > > +     .variant =3D ASUSEC_TF600T_PAD,
> > > > +     .fmode =3D ASUSEC_MODE_NORMAL,
> > > > +};
> > >
> > > Any reason not to just pass the identifier (variant) and add the name
> > > and fmode attribues to the switch() above?
> >
> > Why not set it here, I am not passing any mfd or any other API via of d=
ata.
>
> I get that, and you're not breaking any of my golden rules.
>
> However, I just think doing everything in one place, usually a which
> based off of the 'variant' which you pass as a single value, is a nicer,
> more consolidated way of doing things.
>

Well, I would need to pass OF data regardless, so why not bundle it
with all required info and leave probes switch for strictly mfd cell
assignment. I suppose this is more a personal preference issue. I hope
you will not mind if I leave this as it is?

All other comments you have left and I did not answer directly were
read and acknowledged. Thank you!

> --
> Lee Jones

