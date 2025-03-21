Return-Path: <linux-leds+bounces-4352-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6EEA6BBB1
	for <lists+linux-leds@lfdr.de>; Fri, 21 Mar 2025 14:25:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E0D4B462944
	for <lists+linux-leds@lfdr.de>; Fri, 21 Mar 2025 13:25:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FC6A22A7E6;
	Fri, 21 Mar 2025 13:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZrCFR4Kh"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1811F2BB5
	for <linux-leds@vger.kernel.org>; Fri, 21 Mar 2025 13:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742563513; cv=none; b=RqdqtFxBTA9NxGuwTjn0d2MbEZ3H/JyVn49fzz6S52VFTkr/ux5w5FQXAdfjEn8IPw521XUXEuhMJOTBOK9LlGE62d44LkYV/nk3ebW7yRWJPPwbFAfJpYcuFDaLYx2j9NjjXXWwaydhS3bKbOkrZU3XQo9zmAeb+oyEZ7hBR4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742563513; c=relaxed/simple;
	bh=otsrzQxRTrqYhnDBlDSlkJtC96Ekh1UMsy454LoW+Z4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pjdJSvANhh8J/3El75ezMB1PMXQ8kmTRuo6eWsyAxMan5OzUY6qEGTLZ3NgHRTmgV/sZfujVvpYtlvVEcQgZebyVGDh69lMiq9HuWXqMW6n/bOVlK9WusDTuAl8w0GNfodch1EPRVszV5qCB6AfJMmpPQsxA2gdd/XLpIbD+Zwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZrCFR4Kh; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac3eb3fdd2eso176344166b.0
        for <linux-leds@vger.kernel.org>; Fri, 21 Mar 2025 06:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742563510; x=1743168310; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jWDq6saVyLP87b/VWb+QoYhbvXxSSgJnz8WE5RXFajI=;
        b=ZrCFR4KhO5x82i0mbM6jggSRh1tCcZvnRc7VHvfaYApmSVzqcf21boty5mHRmJI1Ya
         ZJx2ZiBaPYEW2ghmApfHfx4AAV3yvpWRIpLRDuDSTFb8ma3FBgxOAmYdaWBwFRH+3V3w
         e504qohDiFEUYTLofVLTD/+qEztCVaS5p9/VOd7MHLX5NnSFHjHlDwhtW3jNwC7B9AFW
         lG6EiOkY8joftTP3Ux8ua6AJCL978zLSKgQZqeInagHlYvlZoc/2MrYfZUcqZYFS30tA
         3/n4DMgT4B01/dUNCwfj2wuwvffVhjHe4wlFEr9OcNgS8FNfWc3ojC5PMQP+SoIRpUpT
         Pd6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742563510; x=1743168310;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jWDq6saVyLP87b/VWb+QoYhbvXxSSgJnz8WE5RXFajI=;
        b=XOsQgFHdQNwUeBxYNpUWW3sJmZ7kgUYKRVmsF9oHNVIdwTP3IT5keYft073EGYOk80
         dQsx1VXWlD/yjc4Cf7rzvh194Vzw2ZtifqBlbAtP277nw1oJCYZ1ChY2Pm59tasujuaQ
         L6Iuh3NRn2VTMBhJGctANkPD3E/pH23Op4zTXRiHx5Bw33it0cD0dfV/AGX5Ov8fjKYu
         Dbgc7v8hMcDDyaMJuxK/uD4X0W273dk7+pbWVeRbz3KatmLEbGfBvZHgY2wUAXAoj4Np
         1b9eXgRMDfJIWrsZaw/S9Z6mYxNw8yceXVppMQeJB/xSM1cgt7eRS0KskN4vZXD8MbAB
         Ex8w==
X-Gm-Message-State: AOJu0YxXxL63/5TorM9wDl+VZ9jDtvCIOI41tcEGTwrtYzTAriCZW6An
	xFkj6QQA/mJRIAq4GrSXreUe6cA8kflFsdfKjU8WRF1lEJvCgoHeHpE1W0P5vDqPo8fq66dv4yt
	osQX5IuKcBFXt2Wv0mrDOJ/4gjPARngLL
X-Gm-Gg: ASbGncuxWRFwbC9PFEXHx1og4anrtFmAwX7DJREU6Kd/f6ps+eDhwmMYHqiV4yaqS4X
	r80Brt7g8xjX6RoB6pwCGUqf4NXNVL8XAgqRUuqlGiP7/VI6IcdSHzaq5tg/wKG4UMAvcOV/FDo
	6NmlvkmXxsVYAahyn6a2O53XRNgruA
X-Google-Smtp-Source: AGHT+IE22NUlpEi/CnDUHBH4lWq+myij6TzRRR3ZqEMtqA6PtG6VvbA3bvBSOl2Re/89VWHc14C+FM8e9RxVCKFObwQ=
X-Received: by 2002:a17:907:c23:b0:ac3:422b:48bb with SMTP id
 a640c23a62f3a-ac3f25835aamr320655066b.49.1742563509388; Fri, 21 Mar 2025
 06:25:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHp75Vfe1KWDeHGYMbXdExF-7mwA_vXHL-3_TBGyyvMZwgjrJA@mail.gmail.com>
 <20250321092257.GD1750245@google.com> <20250321092326.GE1750245@google.com>
In-Reply-To: <20250321092326.GE1750245@google.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 21 Mar 2025 15:24:32 +0200
X-Gm-Features: AQ5f1Jrar9QxeOBuIPGo880q2g1_6zvegcEvouh1Uvayvta3Rvyf4jXe8BN9y9o
Message-ID: <CAHp75VfN5Acf9LzKkrZgBoL4aK3+oz-sRSpHC-cTfuLrUnFPxA@mail.gmail.com>
Subject: Re: broken Simatic leds
To: Lee Jones <lee@kernel.org>
Cc: Linux LED Subsystem <linux-leds@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 21, 2025 at 11:23=E2=80=AFAM Lee Jones <lee@kernel.org> wrote:
>
> On Fri, 21 Mar 2025, Lee Jones wrote:
>
> > On Thu, 20 Mar 2025, Andy Shevchenko wrote:
> >
> > > This broke build
> > >
> > > https://web.git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git/comm=
it/?h=3Dfor-leds-next&id=3Df33c17919d4489ccff3dd20adc5c02dad5139f09
> > >
> > > Obviously you forgot to update parent Kconfig and Makefile.
> >
> > Thanks for the report.
> >
> > I have pushed a fix.  Please could you GTAL?
>
> https://web.git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git/commit/?=
h=3Dfor-leds-next&id=3D835a0c10d33b54607f49edffbbeaea4c4cdcc49c

LGTM, it builds.


--=20
With Best Regards,
Andy Shevchenko

