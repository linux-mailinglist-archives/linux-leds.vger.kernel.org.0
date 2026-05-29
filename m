Return-Path: <linux-leds+bounces-8374-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KPKeFNZ2GWqwwwgAu9opvQ
	(envelope-from <linux-leds+bounces-8374-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 29 May 2026 13:21:58 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A35FE6018AC
	for <lists+linux-leds@lfdr.de>; Fri, 29 May 2026 13:21:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2992C3004230
	for <lists+linux-leds@lfdr.de>; Fri, 29 May 2026 11:17:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B54423CFF72;
	Fri, 29 May 2026 11:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PTj3gXwy"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94FF931578E
	for <linux-leds@vger.kernel.org>; Fri, 29 May 2026 11:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780053433; cv=pass; b=ksMslsR+2pfyCklPcKAbQBqhkBts2Aq/IHWU+qqJ71iynQq4GtfV3OECi4Kiim6qFCDf3q2w39MgFZiaez8VnpiwvZc8UHVtVxWyldr2D37L6LD8cVvMkam+9X3iDpm/K8Cv6khoNyaBD/SKC22SCwVoCkGpvlRfRJv4a/RUado=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780053433; c=relaxed/simple;
	bh=L3mfJ8b8ZEM+xhFAaS2hUBo/4NjpVXYO+a9psiGQoGo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hbavyIu5JmhcH29UJMW0ZNyDQGzjjnkcSWO1niGRI6irwcEm3i0Oml/+PmYkdZfynPO84ufFdARe4Z30Xz8B0628jw+0HcBMp0Mb3+RnEdY5vNwzJPyb8HQ7BEw8PjlCZXW5+DfvQFtpNlQTwu3uUVDga1WrGdmb66Lvc4P1SXo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PTj3gXwy; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-304545f5206so10569583eec.0
        for <linux-leds@vger.kernel.org>; Fri, 29 May 2026 04:17:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780053432; cv=none;
        d=google.com; s=arc-20240605;
        b=WStHT8gXXbgnScUesSQBjZEwUG+dgUQgUl7SpO1HEGzFGrlflbtKFR4n6+N54CRxNw
         FJjvkkdRxpOWkxEW1gfMSCVsCbS6MGQz7Cp8sq+8Da3SuzT4Q9UxCdVV0SA/n8ZjYqve
         txvwpEm2OwaiAkzJMQ935m2InGqvbFJgWlFQQHiI3TeZ2DIa/ZYH7lnihLR6D1JByBnx
         5zt+SzhYfCyNnw47cR+AI91AVComcpEx2TQrBceFOpyGBxqEb+zUfet5mSnzmukiKu5W
         RT+9FR1Bf5Y8m8cOm1jT/QsNVZTZykLE+iTn9uwGgH+erjXUuVGw0s6qKLtlvJHZQMWe
         bk+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=L3mfJ8b8ZEM+xhFAaS2hUBo/4NjpVXYO+a9psiGQoGo=;
        fh=ikatWPEVScFagNb4nCddAcWFJ4J3Bnwfvd4HeWYWG4U=;
        b=f/JMs6vH2ArXQvbWTuiMwlu9qV/Y9TkijaakYN5WgMooa+R5qKjUaDjhMY0UfTspoU
         YhW7iflrlPuiEtGTRjDsYLo+ryEORsBx78mAHPGoJU+/r7izUFx/2mVS/RY7WvZRIoi3
         P2LB/G6O1fB0zDzcRGnluil2vfJjoIpxd7kjip+xF3v7+3526HeZ1wtCrw5eXG6DISc/
         MefFJApnPEb75oArjkODEY8bTCIhLnAeLXqi4XI2Ip4qb0reVG4EswCRvmmwgLD4XPg/
         YgBCLqtpwxn0dMHFD8c8HPM0Qvc9Ve8lDEvF5AdrgjEgLmfsMTAjIK9Ik3/f9t+s+ASp
         SN+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780053432; x=1780658232; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L3mfJ8b8ZEM+xhFAaS2hUBo/4NjpVXYO+a9psiGQoGo=;
        b=PTj3gXwyVBSTT/HcISlafISe3FMEQr96CaFFu7eOrHtXClvmFwtyfUXLrFPNq1Szs6
         4T15J8oeFmFgejfH0lV54qCPetLHJQco/9DSz2wKZeY3zWQLp7j7LRP67beQVIPGJceu
         rG8UMKA9CCPlFr0DB9YF55wJ5Nx/+YlPajyUV0WSHWT1qWWgAKUooDL9Slj53w1On9wT
         VLffTQKVJ89xrmmM2OYjqsPw1oTC8IEJ3zZqey9ZMHlc5g0zBM2LePCuR5PhGP7UCFST
         GnBjdQKM4Pmo+Lb7UzoiwsoxZ2KFkdlhkdxA573e8QmV6ZuKevBQg9BMJNbKYRy9QFf/
         QrVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780053432; x=1780658232;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L3mfJ8b8ZEM+xhFAaS2hUBo/4NjpVXYO+a9psiGQoGo=;
        b=hW7pG95IhotMSRfGWHZEc+OLzJxavEknd5QnQPzVlbJ6IAJndhifkq5jrZBN1fwZ7A
         x0mb2tXOhQGS9W5Eoq6ecj6VtIJ+w5/MdENx42quNyKLyBdCiDOLFNqdDzFDRKNVMIio
         If6ES265XIaZrN90wO/MGt1izGHg7eh8c18fbUZEV6h/Nu9FcFiGec+9aL31eX2XInAz
         MPSB8w6AUS+3FWA9tBZD9xsJE6KV/Bb06YDn9k9ZkWcNIfUflL4IdmBpDGchQmvGeqaj
         MwX7swgDon0ImU+rsNDpTnLSxj8N4981sfdBoHFgbMfPpBbxtjJRQloJS7anhsVkgH35
         54TQ==
X-Forwarded-Encrypted: i=1; AFNElJ9xCwivi10Z5e6horHcPtFA55j8PjKssVokxwEED69oaQ04athhdu+f9uYzzb+DhwX4uudv/RZB7jqN@vger.kernel.org
X-Gm-Message-State: AOJu0YxRAVtNlVn3ISezG8kiFFw+f9zACk70+LaA+MlQgjC4H2FD9Sdo
	UxznGhnVf/uwBSxiF1xLdUE8k+mlklvngcIp2DZOki8dPyqQGM4EWJBd28t4TccWNT6nsCe2PI3
	qzdB06cIp83TgwBqkgCMww6DOiO2iFLM=
X-Gm-Gg: Acq92OExe/0fQj1VMVxkkPi2r7iEVLd5GjiBfB4gE2XAWOFBZVC/f8vQl3mLxEjIWEm
	BNU1Plm2DLq2/GVc3wKM+dPOd7alIyWMxy+ixZ6jHk2L4PmioIiE2PJrsazMEDOu1XWhLscS4ZI
	37UWmbn1MU23WU/F7ONvUjVxhXeixlENVsXYjunf+c932AW7yffGARE9+JO2pReK1a7+4c16ir7
	NEFH9haVNforskNuZ6+qW/9gS1V7d6epP1aJifo+xXppSbh0yX7Sn14OLHN/79qbEyky+gW0iIZ
	V3kGqiNfoRsNHhLupdA=
X-Received: by 2002:a05:7300:ac81:b0:2ea:c085:44b1 with SMTP id
 5a478bee46e88-304eb17ec82mr985940eec.19.1780053431705; Fri, 29 May 2026
 04:17:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528135123.103745-1-clamor95@gmail.com> <20260528135123.103745-6-clamor95@gmail.com>
 <ahl0La8OQHXAlV3m@aspen.lan>
In-Reply-To: <ahl0La8OQHXAlV3m@aspen.lan>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 29 May 2026 14:17:00 +0300
X-Gm-Features: AVHnY4LHdqQWkZI96KeyzyHPIcreHN1kHpCMC5cCziI3ntwRYA4WURCN1WE3agw
Message-ID: <CAPVz0n0kpYBACOo=YyNk31KGwBEoyrf+dii8V6QY4iRCGd2PNQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] video: backlight: lm3533_bl: Set initial mapping
 mode from DT
To: Daniel Thompson <daniel@riscstar.com>
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
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8374-lists,linux-leds=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,baylibre.com,analog.com,gmx.de,lists.freedesktop.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: A35FE6018AC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

=D0=BF=D1=82, 29 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 14:1=
0 Daniel Thompson <daniel@riscstar.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thu, May 28, 2026 at 04:51:22PM +0300, Svyatoslav Ryhel wrote:
> > Add support to obtain the initial mapping mode from DT instead of leavi=
ng
> > it unconfigured. Additionally, update the linear sysfs code, which uses=
 a
> > similar coding pattern.
>
> Words like "additionally" in a patch description can be a sign the patch
> should actually be two patches. In this case the patch would be a lot
> easier to read if you cleaned up the linear sysfs code (patch N) and then
> added the new DT logic (patch N+1).
>

I looked into this in reverse. My goal was to add DT logic I don't
case how sysfs works. My code matched with what sysfs does I just
included sysfs change as well. I might better drop sysfs changes
entirely since with such pace this patchset will inflate from 6 to 15
and beyond.

>
> Daniel.

