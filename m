Return-Path: <linux-leds+bounces-7534-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0IEyFyiExWlc+wQAu9opvQ
	(envelope-from <linux-leds+bounces-7534-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 26 Mar 2026 20:08:24 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB6933ABA3
	for <lists+linux-leds@lfdr.de>; Thu, 26 Mar 2026 20:08:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 77E75301287F
	for <lists+linux-leds@lfdr.de>; Thu, 26 Mar 2026 19:04:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D08B3093B5;
	Thu, 26 Mar 2026 19:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e6D+KsVL"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EEC433A711
	for <linux-leds@vger.kernel.org>; Thu, 26 Mar 2026 19:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774551893; cv=pass; b=krZY+mrLuXhgz+j2c/Ro8ZR4yNJCvFUMJRCA5Gx5s2EqMREwKDpCacuoTgCfbKlbVdIdusEJSXMZGS/6Fyhu/+t1S1dY9X2pwc0W7NjcwkW4wc5oJ0FJHXsy3rJRHupCdNwwGvO+076uyMnktMoPXubNxpgwRrPzskQXc0yk1co=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774551893; c=relaxed/simple;
	bh=RWTNlpcNdGltwoZYCZGEe+3cY2BbwIINBFwoppx91tc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gQgdCViByVhM1XKb7inXQIDclIWhY+nGQgLTVN5fEC2UqVw1PzJwryZfDIpr4rxfL4DTPrV2Q35ulmggLpx0383taXA8NC61BxfpgQfYT1PE5f6IaEqSu7Z+eqIO3Md5gv4VdX0VnDUOv/tf/kO0BNApYhWRB8uRDMKij+wzdgE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e6D+KsVL; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-66847de014aso2436836a12.2
        for <linux-leds@vger.kernel.org>; Thu, 26 Mar 2026 12:04:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774551890; cv=none;
        d=google.com; s=arc-20240605;
        b=iRhJ2dqysue49FNqVntdYOcR8PDPsdYSuRC9IaQCJHpE40AcretsBnxvyyv+iSerRF
         e0eBJoFfUg4fBQu9raU6ZyDtbvCshxaNWfgsCds+vight5/pnNU3ov1kQhtRC5uu2YXP
         P2aer78v52Ujwib608Q1i8mM4FCo6ty1IZ+ki+lSaAUtcAcJpfF6JiMqz8XuuRworonz
         Tvm8djCB9M8nw0L9BD2RcPOgdCaO9TB3M8A0Yz4RRE2wiWUde93ln8e+J8H7IpqqiC4e
         ajrn0UXYQtnIdfmrfgE9uHK8PG4wAstTADxR5KOB/E+kQtkPNRhAnFRfSRrAQXW+72h5
         ykPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fKnBDIr+tRJpkvUEKn0Xd6uLa/KGKg5mcNt/DWZZSps=;
        fh=X/yKbcLz6auqxei7884iplvjzdpH/lJTDOq8yQscJss=;
        b=dcNzT651GRZxnpG4pgfgZlh8ISz4CU400XGG0u14YILYK/ZcWy2rvawMQO+ZBZmrMx
         2bMgz39uGM/Ckh6gMDhoNDxhA+zq6cgGmsYm2zpdSw5arbB0oCmzwzS+KNWLmOByOFBx
         L2GaeV14sFX2qvr9KMhogmI3MTrnQwv4secAkzeBnXH3bnm9psbqqDoBVpx0gZcKzRsL
         pOu+pSfubeswVaHulHPDacz/YQK1fWiox90JOiJiYD4XQFF+JVuB54yth+NBjwJM7JKE
         h+FEtgBx64aYQ+ixkcZpa0/JI4COUu7zja3EvtafXTGcEbJXRReCSMhgjktuILSlOBMK
         FpXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774551890; x=1775156690; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fKnBDIr+tRJpkvUEKn0Xd6uLa/KGKg5mcNt/DWZZSps=;
        b=e6D+KsVLS1QIdrh5CEWJQDzcyVufTUnY//abIwu/iKYIgcVbGSOGuXfa4R/daKrcwv
         +CEjgB4tP64vpIJSN3AkmkCzFL+i29mixKnriiJqSctxqsh1aVdigeBoIG9JbdZPSpAY
         CCT1IQrqQFuHxr5MxocRhscwtBIH5a79xWr7dRAX2DRFGgwixbIZ2zNIsqftPTNYq9jM
         TnNBHBgp3Rt3XiGLZXCuLnLfvJ85Vq0/siz5tJ5YrjEko6RHpBypBSZm0JV4ZwMVNrcc
         N5tx+sn61+ZRki+0cckfp7/FrXneMCJ9rmM7XW0MNXpvfdGLkYRaWCUepM45G1kq2p25
         qRYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774551890; x=1775156690;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fKnBDIr+tRJpkvUEKn0Xd6uLa/KGKg5mcNt/DWZZSps=;
        b=Jl3FoVMR/9GkeMO5/HRUh/KKP+x7Pljs2ZWr+93YC1Jnu9BYrDj+/hWwmTO2gW+yTu
         Xi3wgeUbfdAN8f2GqFavUrTpJABjU/WwEqo3PO5kSZ4R7v72RuWoGjktjKqWLchoi5mx
         sjFYrbnjwfVzicl0pG8DIMRRXftVJnxxuFo0WILxy/EZn4AERsO+3EmwXcZiWHqltdGl
         Ms9hkXmWlHkcEDTJZKaeiHMlCcPRtYnBOewOW318c+Lgrdcur2375kKLtq7SwQ8KsfS0
         XrP0bG23LwvqM9PEA5Zc2uYkyoXwrqsSsN55qlS+tQo2Nlrj5rekok0YV/Ia4JqiaBPG
         Xt+Q==
X-Gm-Message-State: AOJu0YzyLGj9xPOaYvyv8LP4SQdp4/CF44irhk9EcQOkYLIKF2ZSmpfX
	cD/uTSMkeKoJYfqrGz14mM0NmosfbONwZ2J60KvAUnE3XmH2ZrczK0++Wh86UTfOk6q7EkOpbNC
	dZlyor7ebIJQaksL6RcCd0ML5lhWCS64=
X-Gm-Gg: ATEYQzxNVCE+ujuRZ9InkcdPLfLUtAQDMOKoEuh9uStBVzLfeAFRf02+U85LbtlbZSh
	G2cCIUAwKbfvO9qgHXb6k30NuoQMOXDPPUZwVbpBhC1mZ3tDnJxKxy7Q9AMPDfGw4/bTG4tWspk
	9knkb4Z56tnYGLalknxcSSa5CuVVCokRVgEIsTtd9UDvrwpwPHX9Wy9Y9UNZCnS2T6jslmWzi50
	EZoTbtbkRJ61th5Ob9OOpnHFL+h6Xg27KHWphcKCvdKKDk90HvyRzC+jhSAjGWJcA+piNGpdWZX
	9v+0x1Jt+KvtCmaeeMCpBELurQS1YHtna2qm5n6BTCNNQYNLcKIcitUbicCTRM7ijLq889wPt2j
	XhcJiBw==
X-Received: by 2002:a05:6402:400a:b0:663:d74e:9253 with SMTP id
 4fb4d7f45d1cf-66a826e17dfmr6467290a12.30.1774551889751; Thu, 26 Mar 2026
 12:04:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260320040821.46540-1-rosenp@gmail.com> <20260326113336.GK1141718@google.com>
In-Reply-To: <20260326113336.GK1141718@google.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Thu, 26 Mar 2026 12:04:36 -0700
X-Gm-Features: AQROBzCZTyvHiViM7w4a5wnlj7r-dKVubkWrdoEcXDG9mbkTLQ1oPqON6pUOgdI
Message-ID: <CAKxU2N_8BnBETT8YeDa44bDvC_srepskpA7iDYOwPQJsfb0dXw@mail.gmail.com>
Subject: Re: [PATCH] leds: pca955x: kzalloc + kcalloc to single kzalloc
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7534-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-leds@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Queue-Id: EBB6933ABA3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 4:33=E2=80=AFAM Lee Jones <lee@kernel.org> wrote:
>
> On Thu, 19 Mar 2026, Rosen Penev wrote:
>
> > Two fewer allocations as a result.
> >
> > Required placing some structs before others as flexible array members
> > require a complete definition. Declaration is not enough.
> >
> > Added __counted_by support for one of the structs for extra runtime
> > analysis.
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  drivers/leds/leds-pca955x.c | 45 ++++++++++++++-----------------------
> >  1 file changed, 17 insertions(+), 28 deletions(-)
> >
> > diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
> > index 2007fe6217ec..ee5f02eaa3c9 100644
> > --- a/drivers/leds/leds-pca955x.c
> > +++ b/drivers/leds/leds-pca955x.c
> > @@ -112,19 +112,6 @@ static const struct pca955x_chipdef pca955x_chipde=
fs[] =3D {
> >       },
> >  };
> >
> > -struct pca955x {
> > -     struct mutex lock;
> > -     struct pca955x_led *leds;
> > -     const struct pca955x_chipdef    *chipdef;
> > -     struct i2c_client       *client;
> > -     unsigned long active_blink;
> > -     unsigned long active_pins;
> > -     unsigned long blink_period;
> > -#ifdef CONFIG_LEDS_PCA955X_GPIO
> > -     struct gpio_chip gpio;
> > -#endif
> > -};
> > -
> >  struct pca955x_led {
> >       struct pca955x  *pca955x;
> >       struct led_classdev     led_cdev;
> > @@ -137,8 +124,21 @@ struct pca955x_led {
> >  #define led_to_pca955x(l)    container_of(l, struct pca955x_led, led_c=
dev)
> >
> >  struct pca955x_platform_data {
> > -     struct pca955x_led      *leds;
> >       int                     num_leds;
> > +     struct pca955x_led      leds[] __counted_by(num_leds);
>
> Where is the memory allocated to this now?
The kzalloc call was updated to use struct_size to allocate it
together with the struct.
>
> Why do we need this in both structs?
kzalloc and kcalloc can be combined in both locations.
>
> > +};
> > +
> > +struct pca955x {
> > +     struct mutex lock;
> > +     const struct pca955x_chipdef    *chipdef;
> > +     struct i2c_client       *client;
> > +     unsigned long active_blink;
> > +     unsigned long active_pins;
> > +     unsigned long blink_period;
> > +#ifdef CONFIG_LEDS_PCA955X_GPIO
> > +     struct gpio_chip gpio;
> > +#endif
> > +     struct pca955x_led leds[];
> >  };
> >
> >  /* 8 bits per input register */
> > @@ -542,15 +542,11 @@ pca955x_get_pdata(struct i2c_client *client, cons=
t struct pca955x_chipdef *chip)
> >       if (count > chip->bits)
> >               return ERR_PTR(-ENODEV);
> >
> > -     pdata =3D devm_kzalloc(&client->dev, sizeof(*pdata), GFP_KERNEL);
> > +     pdata =3D devm_kzalloc(&client->dev, struct_size(pdata, leds, chi=
p->bits), GFP_KERNEL);
> >       if (!pdata)
> >               return ERR_PTR(-ENOMEM);
> >
> > -     pdata->leds =3D devm_kcalloc(&client->dev,
> > -                                chip->bits, sizeof(struct pca955x_led)=
,
> > -                                GFP_KERNEL);
> > -     if (!pdata->leds)
> > -             return ERR_PTR(-ENOMEM);
> > +     pdata->num_leds =3D chip->bits;
> >
> >       device_for_each_child_node(&client->dev, child) {
> >               u32 reg;
> > @@ -568,8 +564,6 @@ pca955x_get_pdata(struct i2c_client *client, const =
struct pca955x_chipdef *chip)
> >               fwnode_property_read_u32(child, "type", &led->type);
> >       }
> >
> > -     pdata->num_leds =3D chip->bits;
> > -
> >       return pdata;
> >  }
> >
> > @@ -623,15 +617,10 @@ static int pca955x_probe(struct i2c_client *clien=
t)
> >               return -ENODEV;
> >       }
> >
> > -     pca955x =3D devm_kzalloc(&client->dev, sizeof(*pca955x), GFP_KERN=
EL);
> > +     pca955x =3D devm_kzalloc(&client->dev, struct_size(pca955x, leds,=
 chip->bits), GFP_KERNEL);
> >       if (!pca955x)
> >               return -ENOMEM;
> >
> > -     pca955x->leds =3D devm_kcalloc(&client->dev, chip->bits,
> > -                                  sizeof(*pca955x_led), GFP_KERNEL);
> > -     if (!pca955x->leds)
> > -             return -ENOMEM;
> > -
> >       i2c_set_clientdata(client, pca955x);
> >
> >       mutex_init(&pca955x->lock);
> > --
> > 2.53.0
> >
>
> --
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]

