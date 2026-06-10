Return-Path: <linux-leds+bounces-8556-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LS+3Lw93KWr+XAMAu9opvQ
	(envelope-from <linux-leds+bounces-8556-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 10 Jun 2026 16:39:11 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A8366A48E
	for <lists+linux-leds@lfdr.de>; Wed, 10 Jun 2026 16:39:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Ir2P8Lpp;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8556-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8556-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4FEE0300530A
	for <lists+linux-leds@lfdr.de>; Wed, 10 Jun 2026 14:39:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C653F3E1201;
	Wed, 10 Jun 2026 14:38:53 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BFCA189B84
	for <linux-leds@vger.kernel.org>; Wed, 10 Jun 2026 14:38:51 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781102333; cv=pass; b=KK3K9XY2j67k+Y6iWebs5DKEs+znWDgLvmummog36YCf8hNzX3XpHqnCIpqt/GQ1BH/Gz82CsOwlZ844xNA+onGhQPm1PwHZ4PJhkkk5jFtacY4vUrzVCzfrM4SMb5wRgiOAubesTwZTSXYZTNCI/OZZkpPGiElvcRG9ye701Sw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781102333; c=relaxed/simple;
	bh=TsD6fqLbjN+M4IH/+2UyPBVix65pbcDAr/qNumQhZuQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UjVhNakolx7W/ClFMDnfZRcoAW6tRXKzOuhmAKyyx0k3Dmco050DQsFA5HT+EhhawVpx3QKc4fyw4Q7jNzzgOGiUNNnrZSFM/ouCF/VUnBsSVx1RDE6tBe+/jb8ArZe0N0HosRSEAS3227zAXGSbqKFLrfPlhyM4wKNtcKxac6M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ir2P8Lpp; arc=pass smtp.client-ip=74.125.82.178
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-304fb780deaso6830251eec.1
        for <linux-leds@vger.kernel.org>; Wed, 10 Jun 2026 07:38:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781102330; cv=none;
        d=google.com; s=arc-20240605;
        b=L8XRWc/LHPno/80LkRuYtYvMmruDi9ltT18N71eczJK8W20siAlXIzQzwesVojaJ41
         H9EHf2wCviZ2FqkDawdsV+LR20OrVlYSr8XgekSvwl7hBvV9DsOPzhmQQW9/95GTbRKG
         VQWw1NBa4HCCN6K4ukIJ0Us04SOEjEqgG8hpFdsCuzIXgn5wgiQTEhjomqfc8GS3p/zo
         uIWmH81NSFxTj7gC1gmYtWj9p6gREv/7YYJn2H/H3LJLziM7ebaf0Zp0TGTwbpkA5UGp
         tAqs9d0GBcS4B37FxguR9sDaJk1OmUfZLJsPJQSBij1GPWeyewIP8YIQPZLM5BP7u/SK
         9aXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xEmfQD66YljQgfpm6pWxKEM84AHfr3eAJ9XCpH6lBeM=;
        fh=zhCr3m2rJcMNwmHXX/2iLEBE0Jg+jEJ2P0I0xffRHZ0=;
        b=bsHp9U6bj0faZT35rCYupmdfQWthfRt+fDkuufpD6KiuhP8U/jskuWedIz8EBUI80b
         iURYTDtjXUqgUXnIPIryGKS0qqPRoY6i9unSarhUGCzXRzadt2cbqyBNBSPYsUDl61gJ
         KA90DjU2Nj+c4U3QNzel0DxK9ji8w3bUwuPtUxVqJXiGmAL3bDWeix4U5h1KXsJ5ecLr
         Lbo34qElmJ55hUa7tn6uj3C5e1Xx/5qfIY1G8nkunAmlW9W589gk4Uft1aT7Lv4a4yPh
         YuLFzH7IRosITXJGUny0rMq8fPPE/mlbXlCvLJT4XEhuzIr1ToqFkhhUnlQEcs4kULHv
         i2Pw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781102330; x=1781707130; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xEmfQD66YljQgfpm6pWxKEM84AHfr3eAJ9XCpH6lBeM=;
        b=Ir2P8LppCaNu8VO02fs6YRWeB3T/yRaOZNBvh5K3RY9ngGcc0JwhMi6GJO1txObdo9
         ueYjNMIUYdcQQyO3oDNzqBzhK0UAIGhHOaeley5PmLvz5/EGYezU0CmnA5WdZbkd8sUs
         tW+WdEE7cwZ+cTYL+ntvXVHPZlUbV8EENMNUNfoyLEVNK2XxLflzxhcVWgT6jhBy2/ZJ
         xF8D49TGlNDIZGVKW42urV0GzjFKtOZksfQ8yZXgXq9hzHCWSuOZqNi9lPvIYBLgdU0/
         pY9qIbDWl5qpGKRKZrb5KqWSUlxnJrAPcf3j14+DnwQPkXvZbQ/7smhYQZuELJ+t/dO0
         PfWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781102330; x=1781707130;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xEmfQD66YljQgfpm6pWxKEM84AHfr3eAJ9XCpH6lBeM=;
        b=F+Tergp3VKYRLYxTXzMPacLPqDXVgvWXlkxdM4EuKT2TzEupOLOtZoARKJgrntcvuF
         NLD65HYsCWvX+C4gDBHpm8IVMindnYA4tkaGR5DcuJwYe76waKAhJ0b6Z9BhPqB3gZWl
         bSgNGY86SYXzLscLl30neQI/+w5lNNbC1ppz1U1gCxCtj64g+IJz9lJh3egI0QYNZQC3
         pU/FEmUgIXDFbpKN2eolPyA0tKovdiYBeFsbOoRGIDfpUFYvK9ZzYH5DFTlUxU9EaxEO
         HVIdFm4fat6h+yIzOXetenFOKU/r0iorvRyzeqDd0PGoYGZqIKkiEyMidEkYNW+C3DkH
         KElQ==
X-Forwarded-Encrypted: i=1; AFNElJ+JJX/bor3SJUTfpv7GvtA7qZ6NxdtQA+UcWuj/GByu67Z5zIerfNcChK/BLk7lu+RpwGxrgUFiWMUL@vger.kernel.org
X-Gm-Message-State: AOJu0YzkR4KngBb3FkObHrXOjtzx5FIb+t+uwSFcmZwHPKCEpfYqodrS
	LUWDjfuh3/OZN5/LghOVUfR76ZiJH0Se7Dwzyr5Ga2C/yVZ0mNHONjbKva9q0V+O1A/HSAaroF1
	nUDpv8s1kpU6SVHqQUV1Wf8zqnjGQzec=
X-Gm-Gg: Acq92OFXz6h9GbiS16cQXpV5gJXxAOTJhEhnD7KmK+WJvs9TDNA6zZqqubMCjSaHDWM
	GV76YGJvlMfJTFlQFwyxjj5x/0d9f299cxHorBGJbpgMk5BzOIpHL3sNO01Oq42SAOZtiM6hQGg
	c5+lURZXQongXuOpmtuacwxNg6HE3BdjlD756q6zLbP2IljM4GvlFvJ+LVpLvaklOg/P/U2XHzn
	yYlqWcYkUzbAFyHRNNzfL513QP5iErxGmJouQ3XbjLrPhAwWOYCaqp2gvDEgWCiKOLdlTaC9PrK
	yKTLZ30SiDwS/YYqRS0=
X-Received: by 2002:a05:7300:cc0c:b0:304:e6f8:7cc9 with SMTP id
 5a478bee46e88-3077b1cc840mr15721596eec.20.1781102330361; Wed, 10 Jun 2026
 07:38:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260606045738.21050-1-clamor95@gmail.com> <20260606045738.21050-8-clamor95@gmail.com>
 <aihl9yIqN3adKWLr@ashevche-desk.local>
In-Reply-To: <aihl9yIqN3adKWLr@ashevche-desk.local>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 10 Jun 2026 17:38:38 +0300
X-Gm-Features: AVVi8Cf09c5dRYmH0R9kJGLjsyEz3GTJujrRgluMHRMUhIaWopJLSUHlJiMgJFA
Message-ID: <CAPVz0n2+27QVeWNgPm3PH6V2Ceuym6sbMtUrh7hSHe9PcRmfMA@mail.gmail.com>
Subject: Re: [PATCH v4 07/14] mfd: lm3533: Switch sysfs_create_group() to device_add_group()
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Helge Deller <deller@gmx.de>, Johan Hovold <johan@kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@intel.com,m:lee@kernel.org,m:danielt@kernel.org,m:jingoohan1@gmail.com,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:deller@gmx.de,m:johan@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-fbdev@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-8556-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,baylibre.com,analog.com,gmx.de,lists.freedesktop.org,vger.kernel.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,intel.com:email,mail.gmail.com:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B3A8366A48E

=D0=B2=D1=82, 9 =D1=87=D0=B5=D1=80=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 22:14=
 Andy Shevchenko <andriy.shevchenko@intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sat, Jun 06, 2026 at 07:57:31AM +0300, Svyatoslav Ryhel wrote:
> > Switch from sysfs_create_group() to device_add_group() including device
> > managed where appropriate.
>
> This should use .dev_groups member of struct device_driver.
>

Specify pls, device_add_group literally uses dev_groups, I don't
understand what is wrong.

> ...
>
> > +     ret =3D devm_device_add_group(&bd->dev, &lm3533_bl_attribute_grou=
p);
>
> This will make Greg KH very grumpy. (For the record, original code as wel=
l
> but it already is in upstream. So, thanks for trying to address this, jus=
t
> needs a bit more of work.)
>

In the prev iteration YOU asked to me to adjust this. I have adjusted
and now you say that this is not appropriate. I will just drop this
commit altogether.

> > +     if (ret < 0)
> > +             return dev_err_probe(&pdev->dev, ret,
> > +                                  "failed to create sysfs attributes\n=
");
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

