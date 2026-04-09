Return-Path: <linux-leds+bounces-7667-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6HNKNgfX12mfTggAu9opvQ
	(envelope-from <linux-leds+bounces-7667-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 09 Apr 2026 18:42:47 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CF43CDBC7
	for <lists+linux-leds@lfdr.de>; Thu, 09 Apr 2026 18:42:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 13F8D3006B1E
	for <lists+linux-leds@lfdr.de>; Thu,  9 Apr 2026 16:42:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 688FB3DF00D;
	Thu,  9 Apr 2026 16:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rGGOkLwm"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3DC13D16E7
	for <linux-leds@vger.kernel.org>; Thu,  9 Apr 2026 16:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775752965; cv=pass; b=YdFZ73Y+95tSRHWwB/JMLgSVQn662pYinEb64n01t5my2cFa06ko9NXFhiYxaRHDcgBrjLJ3sEuaNxkQAAeJMpzVNbddOC9mvc6XO/blELgW/tR7gI0aeQ9AhQdxhazVoNaZ6+UQxpqjLP10qnjLWc7ucSScewRJe+5bpIGTxc4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775752965; c=relaxed/simple;
	bh=hKugp+ULINOS5kKhHT2xfbsSJ2A49voOiwbZC2xAVJI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nEpqqLl3EV41VPuK60CJm7zwI9xW7C/cAU/pnHOMha8vJoqTNoiJscVDNsuz+U+IGyP29hkAHwYUDea9/MLm031i3Jgfy9IsiEDWTNuC7Q4qkVJNKpFWKpJTTfxbBsuC1v5BgiAHF8TtvqryiDul+FMFXnpIZjxp6guOPpcWtng=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rGGOkLwm; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b97f9587e6eso156421766b.3
        for <linux-leds@vger.kernel.org>; Thu, 09 Apr 2026 09:42:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775752962; cv=none;
        d=google.com; s=arc-20240605;
        b=HX+io7Xzw/RA/XxQu0/58C6ht7B7eDmWda7cpB3j/4hvnL9U1pEPmQBV9LpG4k/s4T
         5Ag6Io7GGct3b1QVnNtkqAfHZBLmDM6mCHlmU5VDty9g2xzcRnJ3XtT6yoomfFJAFtGn
         ecrukMP1gDCTIwJFFzHdprgstLBu43Us6iBhI97fGlq98QIb2PuKd740Rxdwl+7EN3MR
         CZvMt1qtYyVvehhmTUkvxIJDu4gg4QMoSAZ7RHcqOFIDEmlU3Qs7sib9dXxvgmiXhFOb
         8qZ85FoqNQEDvzTv75xSSWgbqAJuREJBGoNhooN703hVV9YqM1UQW1lgF+J2oABTOcEj
         T5hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=K9uJxnLGDNnIdYqHeQRahaQ1TtxtmtWKqNcMyk5dx84=;
        fh=X/yKbcLz6auqxei7884iplvjzdpH/lJTDOq8yQscJss=;
        b=P5/JK/ATaogsv0DgNebqcWxFlvokguUJAgNk0O6Ct/dFdXKZlykovzdeBDrFfK42N/
         t7LIdr4JT39QCMaX9AqlEU8mLjQmRsRB0+9MqecF1u3S9O6eu1D/lWSEYa49ZlbPw5oN
         12OAzppW4ajpWnuIiOVwIX8uPbMOUxSFc5Ln2lykOwe4rr3WgHIzu4DZaEDFLKrh1N25
         WtVCXDjNXI4eKBmpCTU0QEtTeg4ECttlD6jDlb14WWo7gfMpqj2xF25wQ8ztbkhVZG8k
         4IhaMOAfcCXxIYYAcaxYFltOvBFGwmVDF3IErXPhDZFyuowNFVfgxcn55CLgR0eLLIAd
         pxKw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775752962; x=1776357762; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K9uJxnLGDNnIdYqHeQRahaQ1TtxtmtWKqNcMyk5dx84=;
        b=rGGOkLwmdB8IRFT/Oqe7N1GeWMnFmyvPmwlpBOYpEtWTmvlkQ5vUML+nYnyQ+XLu5Z
         uYAcu90OfZ2fXsLW84/1mZ/8Kt6lJ39EjihhNOZEId7tTwtp80bW2XzmYdMH2IHEbd1X
         0tVv6X1WMzerHmabpmX8goj7KDAB8zZONk7qdxQaBAEDNUaFIZyELGFdKtw+T3uKZPCr
         pqVOgGDRJbwETRmB9yBZQDWiK/W+qKonJgZm4QcM3NBeIH6XWmZLoGB0eGV3PWNm7f/l
         slMZvrRRxw9Qb8Y81G/BHZpmLg5EEHYlzw4sVagAYxKWrAsNMi8kZxXrkilUUxmxq01N
         aT0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775752962; x=1776357762;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K9uJxnLGDNnIdYqHeQRahaQ1TtxtmtWKqNcMyk5dx84=;
        b=Kl/nCOtkohcWUFUVIVU38/AvOZGCOPvHkydEjBpQ5FYnSO2ys7hmQoj9lPdFTdzIPK
         jfYWPRueGc72HLMlS+Sw2/0sg5zRgn14zACSevOJo1g2+FhZFvfgl6o0UZHwkPr2pQx3
         0+oZR+MA4pRXUbyjMMdGpwYjDiJKD6FbpsFlTgUIYbzRBu51yC/S5ZabzKNANlY3UaPh
         lQljuedtDx9QC7B3RHEJr5x5RUJdHp4B+0GdQAVD3LRXlXZvlbTFACkvo545mN3NqzgP
         MhWyAvUEuN6n1TgJ0rErcAHFjDV59BwIBVIo3Ryjt0FAsdgFXUKY8IwWMQCFfTI+IScd
         YLEg==
X-Gm-Message-State: AOJu0YzXFr3iQbSHC//AG00qxlz0/5p8C+IRKxSAEt3x5F/hK9ylQnhJ
	57zgPDpfbtMmi0lObMxCLXH44uLsHn+fMgGjBzypsamuOGX7u/OTcxNpcD0y5QvNgzfpkUcDF3U
	Xlrm0o7XR6SULEaOru2GNDfXeZHfaHT8=
X-Gm-Gg: AeBDiesg9Iq3OcrmdN79OGCf80KTECEFMJDBze03xAUZyQOM9UonyL9JliOmvZpkf1L
	5sWcDVv9hVohLthCMlX/4+f1+HGZV1s+MQVBHon1AZq870aHu5lBFfs2XMPzQ+CSAVgA/5L/TUJ
	eeP823QX+k6zzXffrSkiJR8gfulHETSygXGJ6Mvidi0y7VR6VxDq/mWOUbYaSvtzCuTs6HNkPtx
	1jtYLFRIMtIJKafAlzrz8ypujY6cJmkw6a5FNMn7PCBUHoAhfnMuyZhCjU2j2GaawOv2VpAd7IZ
	MPEoxgR7pudoDrf456TPytzPLc4jndWncwP97oYkVY75rBJg7eUAtcI/4mAER54VfDlWiI5iH5O
	KFviWzgr69G05dey0
X-Received: by 2002:a17:907:da9:b0:b9c:6ef1:ed18 with SMTP id
 a640c23a62f3a-b9c6ef20e65mr1388642766b.25.1775752961768; Thu, 09 Apr 2026
 09:42:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260330211844.14796-1-rosenp@gmail.com> <20260409151253.GH3290953@google.com>
In-Reply-To: <20260409151253.GH3290953@google.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Thu, 9 Apr 2026 09:42:29 -0700
X-Gm-Features: AQROBzBXh3oiBSZQlFW_uV6Y_ikrzIX2Q3pO-LJZnyxbWTu2DIf54LLL33LjVuI
Message-ID: <CAKxU2N9xHS25zhcqwmOpXbgdMN-WDiOcDLTEgHs6WbqPuJ__dQ@mail.gmail.com>
Subject: Re: [PATCH] leds: qcom-lpg: allocate channels with main struct
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org, Pavel Machek <pavel@kernel.org>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7667-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-leds@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Queue-Id: 59CF43CDBC7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 9, 2026 at 8:12=E2=80=AFAM Lee Jones <lee@kernel.org> wrote:
>
> On Mon, 30 Mar 2026, Rosen Penev wrote:
>
> > Use a flexible array member to combine kzalloc and kcalloc. This
> > required moving the struct lpg_channel definition up as flexible array
> > members require a full definition.
> >
> > Add __counted_by for extra runtime analysis.
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  drivers/leds/rgb/leds-qcom-lpg.c | 117 +++++++++++++++----------------
> >  1 file changed, 56 insertions(+), 61 deletions(-)
> >
> > diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-q=
com-lpg.c
> > index f6061c47f863..83cedf4a0cbf 100644
> > --- a/drivers/leds/rgb/leds-qcom-lpg.c
> > +++ b/drivers/leds/rgb/leds-qcom-lpg.c
> > @@ -80,58 +80,8 @@
> >  #define SDAM_PAUSE_HI_MULTIPLIER_OFFSET      0x8
> >  #define SDAM_PAUSE_LO_MULTIPLIER_OFFSET      0x9
> >
> > -struct lpg_channel;
> >  struct lpg_data;
> >
> > -/**
> > - * struct lpg - LPG device context
> > - * @dev:     pointer to LPG device
> > - * @map:     regmap for register access
> > - * @lock:    used to synchronize LED and pwm callback requests
> > - * @pwm:     PWM-chip object, if operating in PWM mode
> > - * @data:    reference to version specific data
> > - * @lut_base:        base address of the LUT block (optional)
> > - * @lut_size:        number of entries in the LUT block
> > - * @lut_bitmap:      allocation bitmap for LUT entries
> > - * @pbs_dev: PBS device
> > - * @lpg_chan_sdam:   LPG SDAM peripheral device
> > - * @lut_sdam:        LUT SDAM peripheral device
> > - * @pbs_en_bitmap:   bitmap for tracking PBS triggers
> > - * @triled_base: base address of the TRILED block (optional)
> > - * @triled_src:      power-source for the TRILED
> > - * @triled_has_atc_ctl:      true if there is TRI_LED_ATC_CTL register
> > - * @triled_has_src_sel:      true if there is TRI_LED_SRC_SEL register
> > - * @channels:        list of PWM channels
> > - * @num_channels: number of @channels
> > - */
> > -struct lpg {
> > -     struct device *dev;
> > -     struct regmap *map;
> > -
> > -     struct mutex lock;
> > -
> > -     struct pwm_chip *pwm;
> > -
> > -     const struct lpg_data *data;
> > -
> > -     u32 lut_base;
> > -     u32 lut_size;
> > -     unsigned long *lut_bitmap;
> > -
> > -     struct pbs_dev *pbs_dev;
> > -     struct nvmem_device *lpg_chan_sdam;
> > -     struct nvmem_device *lut_sdam;
> > -     unsigned long pbs_en_bitmap;
> > -
> > -     u32 triled_base;
> > -     u32 triled_src;
> > -     bool triled_has_atc_ctl;
> > -     bool triled_has_src_sel;
> > -
> > -     struct lpg_channel *channels;
> > -     unsigned int num_channels;
> > -};
> > -
> >  /**
> >   * struct lpg_channel - per channel data
> >   * @lpg:     reference to parent lpg
> > @@ -216,6 +166,55 @@ struct lpg_led {
> >       struct lpg_channel *channels[] __counted_by(num_channels);
> >  };
> >
> > +/**
> > + * struct lpg - LPG device context
> > + * @dev:     pointer to LPG device
> > + * @map:     regmap for register access
> > + * @lock:    used to synchronize LED and pwm callback requests
> > + * @pwm:     PWM-chip object, if operating in PWM mode
> > + * @data:    reference to version specific data
> > + * @lut_base:        base address of the LUT block (optional)
> > + * @lut_size:        number of entries in the LUT block
> > + * @lut_bitmap:      allocation bitmap for LUT entries
> > + * @pbs_dev: PBS device
> > + * @lpg_chan_sdam:   LPG SDAM peripheral device
> > + * @lut_sdam:        LUT SDAM peripheral device
> > + * @pbs_en_bitmap:   bitmap for tracking PBS triggers
> > + * @triled_base: base address of the TRILED block (optional)
> > + * @triled_src:      power-source for the TRILED
> > + * @triled_has_atc_ctl:      true if there is TRI_LED_ATC_CTL register
> > + * @triled_has_src_sel:      true if there is TRI_LED_SRC_SEL register
> > + * @channels:        list of PWM channels
> > + * @num_channels: number of @channels
> > + */
>
> Should we be reordering the kerneldoc descriptions for '@channels' and
> '@num_channels' here to correctly match the updated order in the struct b=
elow?
Yeah probably.
>
> > +struct lpg {
> > +     struct device *dev;
> > +     struct regmap *map;
> > +
> > +     struct mutex lock;
> > +
> > +     struct pwm_chip *pwm;
> > +
> > +     const struct lpg_data *data;
> > +
> > +     u32 lut_base;
> > +     u32 lut_size;
> > +     unsigned long *lut_bitmap;
> > +
> > +     struct pbs_dev *pbs_dev;
> > +     struct nvmem_device *lpg_chan_sdam;
> > +     struct nvmem_device *lut_sdam;
> > +     unsigned long pbs_en_bitmap;
> > +
> > +     u32 triled_base;
> > +     u32 triled_src;
> > +     bool triled_has_atc_ctl;
> > +     bool triled_has_src_sel;
> > +
> > +     unsigned int num_channels;
> > +     struct lpg_channel channels[] __counted_by(num_channels);
> > +};
> > +
> >  /**
> >   * struct lpg_channel_data - per channel initialization data
> >   * @sdam_offset:     Channel offset in LPG SDAM
> > @@ -1475,12 +1474,6 @@ static int lpg_init_channels(struct lpg *lpg)
> >       struct lpg_channel *chan;
> >       int i;
> >
> > -     lpg->num_channels =3D data->num_channels;
> > -     lpg->channels =3D devm_kcalloc(lpg->dev, data->num_channels,
> > -                                  sizeof(struct lpg_channel), GFP_KERN=
EL);
> > -     if (!lpg->channels)
> > -             return -ENOMEM;
> > -
> >       for (i =3D 0; i < data->num_channels; i++) {
> >               chan =3D &lpg->channels[i];
> >
> > @@ -1603,18 +1596,20 @@ static int lpg_init_sdam(struct lpg *lpg)
> >
> >  static int lpg_probe(struct platform_device *pdev)
> >  {
> > +     const struct lpg_data *data;
> >       struct lpg *lpg;
> >       int ret;
> >       int i;
> >
> > -     lpg =3D devm_kzalloc(&pdev->dev, sizeof(*lpg), GFP_KERNEL);
> > +     data =3D of_device_get_match_data(&pdev->dev);
> > +     if (!data)
> > +             return -EINVAL;
> > +
> > +     lpg =3D devm_kzalloc(&pdev->dev, struct_size(lpg, channels, data-=
>num_channels), GFP_KERNEL);
> >       if (!lpg)
> >               return -ENOMEM;
> >
> > -     lpg->data =3D of_device_get_match_data(&pdev->dev);
>
> You just NULL-ptr-derefed yourself.  Did you test this?
This can never return NULL. All compatible entries have a
corresponding data value pointing to a statically allocated struct.
>
> > -     if (!lpg->data)
> > -             return -EINVAL;
> > -
> > +     lpg->num_channels =3D data->num_channels;
> >       lpg->dev =3D &pdev->dev;
> >       mutex_init(&lpg->lock);
> >
> > --
> > 2.53.0
> >
> >
>
> --
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]

