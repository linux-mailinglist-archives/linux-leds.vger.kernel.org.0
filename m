Return-Path: <linux-leds+bounces-380-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B331281219A
	for <lists+linux-leds@lfdr.de>; Wed, 13 Dec 2023 23:38:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED60A1C20FEF
	for <lists+linux-leds@lfdr.de>; Wed, 13 Dec 2023 22:38:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6AC67FBBD;
	Wed, 13 Dec 2023 22:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QOg3anvL"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-vk1-xa36.google.com (mail-vk1-xa36.google.com [IPv6:2607:f8b0:4864:20::a36])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8460ACD;
	Wed, 13 Dec 2023 14:38:50 -0800 (PST)
Received: by mail-vk1-xa36.google.com with SMTP id 71dfb90a1353d-4b2cf7ce00bso2032331e0c.2;
        Wed, 13 Dec 2023 14:38:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702507129; x=1703111929; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HLWuIS891/i8mk8Po2VW+0HfMFW0IVIkJ746lLbBUXQ=;
        b=QOg3anvLdafamjEd6i0gvTGuSs+YszTktNnZEaPoG1pA5TZygEOPIZbUjPJcOPZUAY
         MpHHAWrHFnuxBG2Q3oS+/RZ7bQdLtLIeYAqOWS4do5OuGDgGarKnkOcneeFiT51VCCO/
         eLSx4L98pwAR+4hCse02WUDb5S6PFWq19YBk3U/3wDEsrVKmm+uznaXM2hQq7JahU63s
         +6GTMrGOl6yAgFlMr6Ttl6Y1kq2PIaH6uP+tOh2JojyjOtlgfV8o39g3XFUanOXuvd5j
         c38Nv68B4t/UMMDMMWt5O1FVPjxMFCE0ihAcDoaApw5A0xLXeptSxBSAWho0VrYEq2lD
         it+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702507129; x=1703111929;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HLWuIS891/i8mk8Po2VW+0HfMFW0IVIkJ746lLbBUXQ=;
        b=RGKYdtL9B+JEeWVWE5c/hb2bSXsOn+DYOT4gHJVpZ63A7QBCXY+w/xetDcuMTsS4f1
         RnDxSJCiQYJD44vLQHxgC166amPXUJf3OGwykR79OLD5ajOAoTLRFU9ETqkCYl/mvF0A
         a10vwlVKrQ9AupxVyEmQsm5a8BR6WoJjywWr0R723iBd/ozhlX/TbsK3V3nwu4b4YP3/
         s9IDzjWnD9B6EA5Wt/vCcj703TNdejsW1CUnw1Sjj0nnXIocTJyW9ga5kQTzxrd/LT5r
         t9XSnJxFG//C5N9yh64mMvSHj2CY9/jETOm4rpJbDf3GA5jRDqwOkCbkiHOjz0/TmONT
         Dsmw==
X-Gm-Message-State: AOJu0YxSwyHn15uluFL+8TqXHtCdm9wtOVeiB0wIDivh9KFEpfRMQTPt
	8udfh2kHuPOss6AsaqRKny/7+RqAu5kO0GRofE6Nh1KtqDg=
X-Google-Smtp-Source: AGHT+IEA72sJCg1tWb886mfGiZY/WmWBDak7hL7FWZISYncmdSFQJTEsSf1eyijU0ANVEDLcJi29rH8j1muZd8fNPec=
X-Received: by 2002:a05:6122:1699:b0:4ac:1423:1be9 with SMTP id
 25-20020a056122169900b004ac14231be9mr8733380vkl.13.1702507129585; Wed, 13 Dec
 2023 14:38:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231213223020.2713164-1-gnstark@salutedevices.com>
 <20231213223020.2713164-4-gnstark@salutedevices.com> <CAHp75Vc1zZFWB8PPrg8oeAKz9aHnQrrSjdGyGd8mWcmeZdJ9qA@mail.gmail.com>
In-Reply-To: <CAHp75Vc1zZFWB8PPrg8oeAKz9aHnQrrSjdGyGd8mWcmeZdJ9qA@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 14 Dec 2023 00:38:13 +0200
Message-ID: <CAHp75Vdxa5k-CLhL+PmK0iTPTNSpP77DA6ooWnxfViwSKiEOSw@mail.gmail.com>
Subject: Re: [PATCH v3 03/11] devm-helpers: introduce devm_mutex_init
To: George Stark <gnstark@salutedevices.com>
Cc: pavel@ucw.cz, lee@kernel.org, vadimp@nvidia.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, christophe.leroy@csgroup.eu, hdegoede@redhat.com, 
	mazziesaccount@gmail.com, peterz@infradead.org, mingo@redhat.com, 
	will@kernel.org, longman@redhat.com, boqun.feng@gmail.com, 
	nikitos.tr@gmail.com, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kernel@salutedevices.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 14, 2023 at 12:36=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Thu, Dec 14, 2023 at 12:30=E2=80=AFAM George Stark <gnstark@salutedevi=
ces.com> wrote:
> >
> > Using of devm API leads to a certain order of releasing resources.
> > So all dependent resources which are not devm-wrapped should be deleted
> > with respect to devm-release order. Mutex is one of such objects that
> > often is bound to other resources and has no own devm wrapper.
> > Since mutex_destroy() actually does nothing in non-debug builds
> > frequently calling mutex_destroy() is just ignored which is safe for no=
w
> > but wrong formally and can lead to a problem if mutex_destroy() is
> > extended so introduce devm_mutex_init().

...

> > +#ifdef mutex_destroy
> > +static inline void devm_mutex_release(void *res)
> > +{
> > +       mutex_destroy(res);
> > +}
> > +#endif
> > +
> > +/**
> > + * devm_mutex_init - Resource-managed mutex initialization
> > + * @dev:       Device which lifetime mutex is bound to
> > + * @lock:      Pointer to a mutex
> > + *
> > + * Initialize mutex which is automatically destroyed when the driver i=
s detached.
> > + *
> > + * Returns: 0 on success or a negative error code on failure.
> > + */
> > +static inline int devm_mutex_init(struct device *dev, struct mutex *lo=
ck)
> > +{
> > +       mutex_init(lock);
> > +#ifdef mutex_destroy
> > +       return devm_add_action_or_reset(dev, devm_mutex_release, lock);
> > +#else
> > +       return 0;
> > +#endif
> > +}
>
> If this is going to be accepted, you may decrease the amount of ifdeffery=
.
>
> #ifdef ...
> #else
> #define devm_mutex_init(dev, lock)  mutex_init(lock)

More precisely ({ mutex_init(lock); 0; }) or as a static inline...

> #endif

--=20
With Best Regards,
Andy Shevchenko

