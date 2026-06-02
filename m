Return-Path: <linux-leds+bounces-8431-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id T9hPKQDGHmrWUwAAu9opvQ
	(envelope-from <linux-leds+bounces-8431-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 02 Jun 2026 14:01:04 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D0562DCA2
	for <lists+linux-leds@lfdr.de>; Tue, 02 Jun 2026 14:01:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=HpnsARGD;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8431-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8431-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A9BF5300601B
	for <lists+linux-leds@lfdr.de>; Tue,  2 Jun 2026 12:00:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E52031A6811;
	Tue,  2 Jun 2026 12:00:29 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A833D2248A0
	for <linux-leds@vger.kernel.org>; Tue,  2 Jun 2026 12:00:28 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780401629; cv=pass; b=qUHO9k8lYNI0wqhuxmgVReK7wBUsV4aZnB3VLK8bjCzCk+fLVE0VaZ2oaNdlFfpBc3oEWL9HXVHOXqLapwAZEo8sLUNFIsa70YPyoCwkDoeG0DvhaMUOyGLHW5ZSPXLPgS3gmV/3mflwdDQO24BAac74qAUvvfTmPXYdrlDlf4A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780401629; c=relaxed/simple;
	bh=05RkR29gR0EzADOG/MdNwo8HCGHyLs1e+QZ7FIg+Q3g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DN1GWBkO2zDidZv+Y0E50ItUxO7s7WdKebIPjg7hBu1ge1h7cPJi27uy/ReI9fskTzntcoprNIh31pCFMToairXbixoINz+b9LQKbhYEIKMwd3AnApDPM5FyzSXAnt4ecr+3zvkkclytYRr7SPsGdfeeZp0Wd3Vqs0bvhyiSupc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HpnsARGD; arc=pass smtp.client-ip=74.125.82.180
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-307263ad0cbso2226451eec.0
        for <linux-leds@vger.kernel.org>; Tue, 02 Jun 2026 05:00:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780401628; cv=none;
        d=google.com; s=arc-20240605;
        b=E3tMX2wMNn9plRGBcoyl/WlwyEq85r4R9KRJjDivWpsYV2bR+oO9YDgOkfvAaJKbuk
         DRI7IuyA89qrgItAytEIz+xqIxNw/uSB91n3gJwFVfNv635a9LeiySIfpDENmw5HJDkr
         kQjNsWS0SVSL9P5swZuaO08QBpQV6VCch8cXELeuhKfwV/hwiWcXjgn7ngvngaw02ZYh
         e6Pa0oIvpG29D5e6wdiZSxvn5XRl+d0TummrKJzSDApff0O/V3WGgRkF8SNi+Zij5CLU
         4ariraNrb5y/3Ho9iqSVo5o0zF9rGTVU4aitbiSPn2WU4zdfvkOb1tjf8UYSHqO/+5iU
         lhcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ltXCCc4wpurtipYSrGSPv75JAWyLn0B0neQXenFUA+U=;
        fh=ojWKTJF6L8mskHqWfB9ItQuWZHRbWm9kdoJXuC52ZIE=;
        b=AU8YExziifJiQjuYxyGdTIj4jrlcH2qeWXGqgB4AoB/+Bes+L3KZDgURsxoWpoPzyQ
         Y8WLb5ePLEZ5FWfRqSzIQXM0sPwI0UuMk+cxPcYAtyf+ogJ+7ZuE0Jpqg969NP34PGKr
         uVBFQKC4IDOXo6q0sm6qborKcgQSdtBAnxXHedVqdpdMx3Gbss7Cq2z4XyBtqWGvxcFa
         y3SklKLxAqH/ZVBD09qH1JyOwDgrSwIcZnxha4UEcYt6XpKHeViii74wN6Ezov6YoYOp
         vqzSXefxG+yq9BfdR91e23av0vVFWGARdLMa7t0YXIkt1H+7rxg3mdSMP2FGa3L7lsnF
         zFJg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780401628; x=1781006428; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ltXCCc4wpurtipYSrGSPv75JAWyLn0B0neQXenFUA+U=;
        b=HpnsARGDbG9IQ8Dv/Qfp9jbpu2ux3zNde1400BTJXTkrP2TPdyLLOpUzZJcSm34fkN
         eP2AsQMgG/vfz3G5vcEBK37CCZ3AkO/BaD+yjBkhtDQcVPSSOgCkq6AEIxF62a6+ct+f
         iw+Jh9ScEE6KmIo82LayCV5q+Iuu2JNsgwzuPCGxSuggPdIqzIMr/7A3mvYCsOHBsKhG
         9hcorNNVF3k2l7r+elR0Qi4uyFQHXO5LT+G94KFCRplQboEDCnyd6GVkLGWVpAqqTc3p
         Yd89XnO0iL4jAfioBfqaElG1Vh+ABP6WCMuu5xPzqQIHQS1bMUpPwzhjcCBD6s2rea90
         fASg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780401628; x=1781006428;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ltXCCc4wpurtipYSrGSPv75JAWyLn0B0neQXenFUA+U=;
        b=UH5tdMMBNV1I2o6K7Iyf4hhbdz+RQ1b8r4+Nqa7v41PUvSD3Z6oAJksLAm/M5dL7V4
         IwwDc3g9k1FYHcLa0coTe31ByTMVH5bGG/zoJ/ltkxy5m0F97W1jnbMxkxgXICjsOevd
         R1nOfhHMgzdp0i4s07HmErLzbfHbV1xfHfEirU7sKgce3U4f/5bgZBhaLPGNFW3eToxi
         mUUPPs15DalF6BGn3Wat2D8Q5pBxvao7PSjvSCnrEFfU32XF3FA0dbhuu1J0dRnidHU6
         8iMzINqRmE95zIwUhWryFWhLjTxLeckhGKU6ECiOnJCJzKudEk3lZUCftCWiH5AZptha
         cEiA==
X-Forwarded-Encrypted: i=1; AFNElJ8N3CKi7gh1AYPxSPWv4k3z7b2oibXXqrtkolbFW4VXWnSCV9xeU/F89bFP6ZJvUzl0zGSNYn/wphWJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyLzbEKT5pTk+wKzIaG5P40bHMYixuPKw3TnR0B/4Gn3fKEpc1D
	+MVSbvLsJgof5w8dzk4xHPXUEg12hhvnPM5b3jGdkMdsNNSd4FwKdew5pEVWZBQWhrVH/GOhSFF
	6a9aSA8XaY6eQdMsRKpA69XITEhZyVOY=
X-Gm-Gg: Acq92OF2vOkSkf4jio/zkEFmP3mt9TbdU5u4tZ9grHWc+Ram7ByhE3AHyvI+Vie9lRt
	1SScwT9D6JGfme+8y7M1PwcGfn/x9SxH9enr4cNkX7U52br5BusW/A3+nPoIUM/JKX0Ta1l9o2Q
	SzzG+zDnYEeld8Xav3IJV1QIO+mpsRuoeEP4EagcfZjMGCvsp0J/VxbBxEtKCn7YBQU/MC68ZBa
	6HGcKqo19FvjRXnfmsuiMwsvF4BWKUKBnWzeHDWyK2T/xZycCL9XNxiPLwQY7YOeVD/6WSisX2m
	sEdzfDDaih+Qxunugdk=
X-Received: by 2002:a05:7300:6da3:b0:304:cf6c:4cfe with SMTP id
 5a478bee46e88-304fa4d506emr7133140eec.9.1780401626958; Tue, 02 Jun 2026
 05:00:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260601151831.76350-1-clamor95@gmail.com> <20260601151831.76350-6-clamor95@gmail.com>
 <ah6TGjRNnDpQGO60@ashevche-desk.local> <CAPVz0n21RGAaJc1sda4xyp1h0z+6R6FJ4=XWdOtB1mgtV8=RUA@mail.gmail.com>
 <ah648F2plc4UHTM1@ashevche-desk.local>
In-Reply-To: <ah648F2plc4UHTM1@ashevche-desk.local>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 2 Jun 2026 15:00:15 +0300
X-Gm-Features: AVHnY4JW9CHRHy50Nkm6GtBSzM61Oxt7rnaqb6kAIuOEvYU0rp0GBajm0chAidM
Message-ID: <CAPVz0n2J6cmWyYWL5aQcFJeDEezD0P_ianTjqUzXiFuDsYbVmQ@mail.gmail.com>
Subject: Re: [PATCH v3 05/11] mfd: lm3533: Convert to use OF bindings
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
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@intel.com,m:lee@kernel.org,m:danielt@kernel.org,m:jingoohan1@gmail.com,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:deller@gmx.de,m:johan@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-fbdev@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-8431-lists,linux-leds=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,mail.gmail.com:mid,intel.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A2D0562DCA2

=D0=B2=D1=82, 2 =D1=87=D0=B5=D1=80=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 14:05=
 Andy Shevchenko <andriy.shevchenko@intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, Jun 02, 2026 at 01:31:44PM +0300, Svyatoslav Ryhel wrote:
> > =D0=B2=D1=82, 2 =D1=87=D0=B5=D1=80=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 1=
1:24 Andy Shevchenko <andriy.shevchenko@intel.com> =D0=BF=D0=B8=D1=88=D0=B5=
:
> > > On Mon, Jun 01, 2026 at 06:18:25PM +0300, Svyatoslav Ryhel wrote:
>
>
> ...
>
> > > > +     device_for_each_child_node_scoped(lm3533->dev, child) {
> > >
> > > > +             if (!fwnode_device_is_available(child))
> > > > +                     continue;
> > >
> > > Do we need this check?
> >
> > This is nice to have if the node is disabled. If we assume that there
> > are no disabled nodes, I can remove it.
>
> It's already implied. See
>
> static struct fwnode_handle *
> of_fwnode_get_next_child_node(const struct fwnode_handle *fwnode, struct =
fwnode_handle *child)
> {
>         return of_fwnode_handle(of_get_next_available_child(to_of_node(fw=
node), to_of_node(child)));
> }
>
> And I believe it's written somewhere in the documentation (if not, feel f=
ree to
> patch that).
>

Very nice. Thank you.

> ...
>
> > > > +     ret =3D sysfs_create_group(&dev->kobj, &lm3533_attribute_grou=
p);
> > >
> > > No way. You should use .dev_groups.
> >
> > I did not change how driver does this, just swapped lm3533->dev to
> > dev. I will set is back as it was.
>
> This is a serious race condition that needs to be addressed. Since you ar=
e
> touching this driver the fixes against known issues probably are the firs=
t
> things that have to be done.
>

Fine, I will have a look.

> > > > +     if (ret) {
> > > > +             dev_err(dev, "failed to create sysfs attributes\n");
> > > >               goto err_unregister;
> > > >       }
>
> ...
>
> > > Can you think on how to split this change to smaller steps? I believe=
 it's
> > > possible.
> >
> > No, I am done with tinkering with this patchset. It is broken enough
> > and it has inflated enough.
>
> Probably you don't want this to be reviewed then? I believe other kernel
> developers and maintainers will ask you the same.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

