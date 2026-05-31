Return-Path: <linux-leds+bounces-8401-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iHdyBts6HGq1LgkAu9opvQ
	(envelope-from <linux-leds+bounces-8401-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 31 May 2026 15:42:51 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB0D61667E
	for <lists+linux-leds@lfdr.de>; Sun, 31 May 2026 15:42:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4DBFB300EF55
	for <lists+linux-leds@lfdr.de>; Sun, 31 May 2026 13:41:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 740712DC350;
	Sun, 31 May 2026 13:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FtMzZ9HF"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22FD92C031E
	for <linux-leds@vger.kernel.org>; Sun, 31 May 2026 13:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780234879; cv=pass; b=YooNNQSynY69FTJ6Rk/T46DQ7VX2SREOwddcDgELflXNidvdW91j629NNwL6YRP99Fm0moLgcj7ZbwVGpklk2dWbkhi0fPbRFjwUFSB0+43lf1DBqyI52fVxpO29DDn6MsYoN2w3P5fEp56fiG1NJxWVAt063xAUUh4+2IeNILA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780234879; c=relaxed/simple;
	bh=sRKrVpOBYWRz1+LYXhppMZyOZPgVxDKjQ5CHY9lps6Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dJi+ov9pLsNnqseeB90IZB3fVg5JAnItJ4sHTXPF9Pk+jQgqSRmyIEwd+YO/LJO96E3Eu8GEqPwOiQDuhxA4xCum7MO+WCN7c5sC1lM2nkhOMEbOMLJCI+z+mBHXF/OkR9yFPJdkF2dXphUhJxNK//RrOFZlLBA4E0vqesB09c8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FtMzZ9HF; arc=pass smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-6605d7181c8so1156128d50.0
        for <linux-leds@vger.kernel.org>; Sun, 31 May 2026 06:41:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780234877; cv=none;
        d=google.com; s=arc-20240605;
        b=CGL8xeLy71Desvk0oWCXrUv6BQX35YzdUuBj9sKUZgJJpgmAgqunlsVV2Sx+nuQP0r
         jleLrWtxi2dQ+5Wpviy1nN1YS3tZpKMbAdvRl462XHdQtiFDFIQxlDn3pEI4MtSCvMwt
         XLbcPlJG8l8v9kk/pGXj2gl9Yrik/0ejY1SUS3cv47gSQvcIVWPqaAp4rzlGjz+1xNkB
         ONjOhFQaPWF+J0kccEBuSlwPapNILZs8bQCAkqtel7D5LDFaOjuQ570efo+0XOxXVFnS
         U8InNBMMN3WZD/WYc9C2J2t3If2hxYDiQBODfWvVFWqQ1DDe2x0ojkVYyb/I0AUty+//
         aUEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=W8tNhRdMJuaMOTUnOf0m6tloKSSO7YrbXYFMK56eT+o=;
        fh=b6oZJ8r6uOoSt/oEbAMG7PmBjEgA2ek3wXiHRl+0YSk=;
        b=Bj0/mF99WGQK0sB9OvnWUJcPgoPg2Y0uP+QJgOgIF7L2uXWl8cX7cNJsyeFsRfDtUT
         nXFZE79SUA15RXdGHP4MPcaQnM7wrKtpaIYxfSpvaaPKeqQu3S1jUy+mvnCLb87YWc1q
         eWCKz4hxAVD46EdBfzNbVJUFaP2VbfR4mKDGsONvQXqriKEdpUJlxPli0vVceyAsuHes
         GAyoc2a42a8jx0El7lUOsfL87mnsaS41MEIekDIB0aGplhxE5BJzer1VNS2ph7H3ufeL
         e65Aelnh1lBc5noiNZ3GKFR0FEXRrsYvmlP8urv5a31ozU7Wfmk1oXxXG9UXN5LbgRgn
         IrWA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780234877; x=1780839677; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W8tNhRdMJuaMOTUnOf0m6tloKSSO7YrbXYFMK56eT+o=;
        b=FtMzZ9HFZDMN2kwFsjP8e0I/CBTYJ3/APA242K+sISQ/fc3isA4IZv+46x+7o++SHM
         9WCJcm3udwJtAD9DF+emVwCch9DK2ZimfNmcCrCMxq0mjzSgMDBwxbUzuQIDa1f2J1x6
         7IqB6L/kPzim3vg4CBuOMG1aQ2jwN0XKUCakYElGFC9pSn6TtG67yM9SvEOpJ06r0EBl
         KJ5LwLAgVMT3VWfDjs2OJCYz1D6FiNYsRcTZ4LMdCeiQAc7cEhJQTygnhJPGJ6D40I0r
         m4mQUEKKLwUN+/4CynkCwrterLC04XKnbDMqvD9AWSNpiWZFkO1BXMn2mQUYltwiphgN
         0xiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780234877; x=1780839677;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W8tNhRdMJuaMOTUnOf0m6tloKSSO7YrbXYFMK56eT+o=;
        b=aTrH5Hwg+pKiHbn1k4jPvxN4egG30T1Zjvg8d401yGP+zqwp9CNATc6M0bqHvvtTlZ
         RybNUcDBcZBT92gWLPPmjFPosfoyJGRqZfSSpmi7UbOFiv2kHjc9rKpi4BYUGpo9GlbZ
         wD/tQXIWaE4lZ5iSmcwCeHwvVBUp2qDss9jw+oSOHces2tQK4DBVNRCph686THiI0etX
         KFxsEsMDXl8S8UFgW4ILigxvogIqP86Qg4eEm+BCOpgvvafgJa+ISR0WhedHe/hhF+mJ
         FyVyQBslexc++C6s5ZLTommerLwpd6oR1j1q1k5WMxIpaL9GRXogms40LzNDA82yyiLt
         WzJA==
X-Forwarded-Encrypted: i=1; AFNElJ+lXqyrl/J561ODzLeg4hvUiJAAD5JBws7jXjS5N6+zYjRQuvueCZdzB1TE8EINrsWnU1+f0EmxEn94@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+mM+rVsdO4ONnoLau2SM8YL/v0XN6URDySekrq9+Ykh1X2RpW
	Bm42pZmyj/S0HjDQ4Vu2Dk7gMbGkhB1mQdRd/0vNxBFzfUtfEhixdFSklwLX71u3as+IX7cTcBs
	3gkY2cOz75msVTTe+eJlfrf4dYSi8aRI=
X-Gm-Gg: Acq92OGbx5sya9OaYFEcexe+s3aEOY6fN57Uw1Nbvn0D9DgQwdTYw/38xFPXTvUmYNT
	ylNaR9SczQMKiS+gobS8yQ6o4UVjv/BAKxA96ym0IBfFOnL6By5MAaqkNqM+hdAQDDROyJMhbp2
	Xp0QgsmH2W7QXPaWsWueXoTuTFuG8R7sCt8I8L2Avvzh+eYDua1HUaZ3gKMh7R0L9pqbvZ0oeGA
	Qe6YSfvzzGaUxZjcZaISMIXIoDBbhGYaltfwd2vJRjerg9sDEp2jx9JWcYz58/YUdeaYdz4XJbd
	gb28j0Tp+sDVTPK9mI4af8TX8Yr1vMkHomlkkFVIcMSZaEOPSejKMOZdUCazKDn1sBMvVfRO47t
	rOQ==
X-Received: by 2002:a05:690c:c4d1:b0:7bd:5af9:f0a1 with SMTP id
 00721157ae682-7e05d3f3c57mr59371557b3.25.1780234877079; Sun, 31 May 2026
 06:41:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260525033258.144291-1-ninadnaik07@gmail.com>
In-Reply-To: <20260525033258.144291-1-ninadnaik07@gmail.com>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Sun, 31 May 2026 15:41:05 +0200
X-Gm-Features: AVHnY4KJfn3MZPFX_KGyjh71dDrddHBfvkTmSAHTLi-XV7OebVew5E4SYYsjU94
Message-ID: <CAOiHx=kdH5TFUxTZdyphy9Xd+i8Gh7nU1Ab9wxLvK1och=JAhQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: leds: bcm6358: Convert to DT schema
To: Ninad Naik <ninadnaik07@gmail.com>
Cc: lee@kernel.org, pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, me@brighamcampbell.com, 
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org, 
	=?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8401-lists,linux-leds=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jonasgorski@gmail.com,linux-leds@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,brighamcampbell.com,lists.linux.dev,linuxfoundation.org,gmail.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,devicetree.org:url]
X-Rspamd-Queue-Id: 6AB0D61667E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

for some reason my email filter didn't catch this ...

On Mon, May 25, 2026 at 5:33=E2=80=AFAM Ninad Naik <ninadnaik07@gmail.com> =
wrote:
>
> Convert the brcm,bcm6358 to DT schema.
>
> Signed-off-by: Ninad Naik <ninadnaik07@gmail.com>
> ---
>
> Referred to this thread:
> https://lore.kernel.org/all/20250930-brcm6358-to-dt-v1-1-ba833ceb1575@the=
goodpenguin.co.uk/
> and added the fixes suggested.
>
>  .../bindings/leds/brcm,bcm6358-leds.yaml      |  98 ++++++++++++
>  .../devicetree/bindings/leds/leds-bcm6358.txt | 143 ------------------
>  2 files changed, 98 insertions(+), 143 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/leds/brcm,bcm6358-l=
eds.yaml
>  delete mode 100644 Documentation/devicetree/bindings/leds/leds-bcm6358.t=
xt
>
> diff --git a/Documentation/devicetree/bindings/leds/brcm,bcm6358-leds.yam=
l b/Documentation/devicetree/bindings/leds/brcm,bcm6358-leds.yaml
> new file mode 100644
> index 000000000000..a61417e5690b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/brcm,bcm6358-leds.yaml
> @@ -0,0 +1,98 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/brcm,bcm6358-leds.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: LEDs connected to Broadcom BCM6358 controller
> +
> +description: |
> +  This controller is present on BCM6358 and BCM6368.
> +  In these SoCs there are Serial LEDs (LEDs connected to a 74x164 contro=
ller),
> +  which can either be controlled by software (exporting the 74x164 as sp=
i-gpio.
> +  See Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml), or
> +  by hardware using this driver.
> +
> +maintainers:
> +  - Jonas Gorski <jonas.gorski@gmail.com>

The driver and .txt schema were originally submitted by =C3=81lvaro (added
to cc), so I would have expected him to be the (suggested) maintainer.

Best regards,
Jonas

