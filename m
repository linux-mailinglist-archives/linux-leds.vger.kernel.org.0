Return-Path: <linux-leds+bounces-6104-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DF461C58CA4
	for <lists+linux-leds@lfdr.de>; Thu, 13 Nov 2025 17:41:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE3803AF7A3
	for <lists+linux-leds@lfdr.de>; Thu, 13 Nov 2025 16:31:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AE7335B147;
	Thu, 13 Nov 2025 16:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="D2KIlBds"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E2E35B141
	for <linux-leds@vger.kernel.org>; Thu, 13 Nov 2025 16:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763051080; cv=none; b=rkZk/fv2ABdE/HmNBBM/PqMZe5tICMbA4gqrjIsdv+GMJMg5yquP6rk3bCdrRnAYotlN9UK05jMXOOril2wEl1dEwYf0IndHR8q3mOSJV9/9bFeYIUTwP0xKoT3iqYXH3Zg9pv76kGUpulKyXU+JkrpxuegFYilaeECOLT22BPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763051080; c=relaxed/simple;
	bh=aeVmA8Pr92K0H3iROp7gH8ySG1VZ3qmx/UfHcCZzabI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qEOGdrYMbZ8iuqV/qcmlZ8rNIo/M6Q/p3glIB8gmePPWnsv8QRczvsuXXgfTASz32vzA9gYuUHE1OOzXpo42rsqZJR19K74gNKONUMdFpR2LQnt7wk6je4SzT4dlolYkoS96aeg+kfWLLeXxTN8ALvNrVaQ3LxgfiU0Z1UvFQ1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=D2KIlBds; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-594270ec7f9so952872e87.3
        for <linux-leds@vger.kernel.org>; Thu, 13 Nov 2025 08:24:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763051077; x=1763655877; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b1lknOy+g7X+WANvKXEUsNPHel1RfvJ2YmIlYIxgr0M=;
        b=D2KIlBds56wIptSYvoPtNnD52UDjtWYobQF37C0KEF00ycy5MMG4JiG1hqRB8+XT92
         fUD3avPhlPYXEsI1aP6vy1Pia+smJ8LaeCtQaGQoADuzrlZ/W9gyNk3R4yqSIXYfyWN6
         DjoBuS8Oqdix5dAKOwHKaVfUkNuqUkaOXrUa9StQqBJKtXfNVnSiq3Cfd0w38tkKhT0V
         uVy2gBhJ2wFfsGR1FOo1K1Do0YrVnPAdQoSyS2BiLPI2Vgl8gJlLg8bEQM99dqEfKURS
         cmIeCBxW1f7v43L9fmFekvcOKDYW2oPhsb5GmInj57ll3A4Uep/atUS1jME/3BlRgnoW
         39oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763051077; x=1763655877;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b1lknOy+g7X+WANvKXEUsNPHel1RfvJ2YmIlYIxgr0M=;
        b=UYU8D6pwB0GDEh8/DAar4/DyK0zktkRBNwML7WUWS8XkpLPgbTX9mq92FKjo0LcZYh
         VJZLodWpd6nFr0fu7GMBqZU0S1cUl9V2AdhnEcvR5kRvzSFWcW1SR7xws0UslFIQJGXf
         8BsMef6hyK9+d+asg9YCwtpnwk16lRgyuTM1k59jJWm/OANOWHd1/JqZ/dtvaES7uZbF
         WVcbklYI/Tea+MPIe2IusuVKn510OUBF6tNhAciGWMhjHYLrti6aKyCkok2CQR6QBprL
         NQYK62PCFkXesXd6l73AjhhWo6pG+U3YwliCXb0oNkoYWVoTnnyCIWWwnK29YA+YJ8nL
         aUfQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9fQqQomFzSURLeLM0/3+pcpI3aeJalFetL4C/G8tUaHUo3QMBdL+GkTPkcaiYeP25POFuRS7WCtHm@vger.kernel.org
X-Gm-Message-State: AOJu0YxAMUXKJzM7rqktSKXFJRSntGMwS8BU4gu+1023kzzLccEBYasx
	t74GYCjEqjPPAx8a09wz4JP22GM6KVEBSU2N2p2de5LwhRpiRM4E5OHD7gc0q2ApHZzkS9F6Wkm
	0XyckEu3CE0WXKAb751fBulUKr8/sst1R+ueT1yM1Ew==
X-Gm-Gg: ASbGncvF2ZDwyivAYbuXeL/RTedS46ZCHX+FcRWnoTJZXijQIMfmUuwUpLihapPKckt
	bLiGulHsdbYZQU7yJ1GykoCUid1pukz18eyC8SQvv0zIPh6JUPGuNgPQGj+fS/xU1NoQNbzCxeg
	ynuG82IY+izN2Tce82+U+EC08dif0av7KwY6v0q+etSCsDdSl82DXtQmMevAwR4lSMuv6yILMPE
	sttQQEsA7IY7SoqecLxne87SmIPXWagPPFMfeNeZ8HqUcEE6oMrps1t6u6+EnE55OWUb3tybPlQ
	y1OZgmI9JieT7wUY9g==
X-Google-Smtp-Source: AGHT+IFodDdmDF4OGIpR/wS4dGrXhmEdlZZmBi+Eep/VRxdV/hIiOL+UeuLXUUOhkIo/i+h/vdsVzGczBZsRa2swZ7w=
X-Received: by 2002:a05:6512:308c:b0:594:3311:1e6c with SMTP id
 2adb3069b0e04-595841e601bmr31650e87.32.1763051077082; Thu, 13 Nov 2025
 08:24:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251105111924.141555-1-marco.crivellari@suse.com> <176304937940.1554738.14671753263913309288.b4-ty@kernel.org>
In-Reply-To: <176304937940.1554738.14671753263913309288.b4-ty@kernel.org>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Thu, 13 Nov 2025 17:24:25 +0100
X-Gm-Features: AWmQ_blXPA8QEo01XWRXsor7LUf07lJZK03vUO23wsNB18k5wcBtaYpHFDH7Bhg
Message-ID: <CAAofZF4PKmWYU5jj+8CuPDp6P1CvtivqESFAYTuTQ-Hucukr9A@mail.gmail.com>
Subject: Re: (subset) [PATCH] leds: trigger: replace use of system_wq with system_percpu_wq
To: Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
	Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Pavel Machek <pavel@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 13, 2025 at 4:56=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:
>  [...]
>
> Applied, thanks!
>
> [1/1] leds: trigger: replace use of system_wq with system_percpu_wq
>       commit: 88aa23c12888348bb4910e75a6088f0affc86923
>

Many thanks!

--=20

Marco Crivellari

L3 Support Engineer, Technology & Product

