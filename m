Return-Path: <linux-leds+bounces-248-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A17C803C85
	for <lists+linux-leds@lfdr.de>; Mon,  4 Dec 2023 19:13:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 505901F2112C
	for <lists+linux-leds@lfdr.de>; Mon,  4 Dec 2023 18:13:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 021D028694;
	Mon,  4 Dec 2023 18:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dv/oxZfY"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2DC5FF;
	Mon,  4 Dec 2023 10:13:39 -0800 (PST)
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-77f0ecdaa50so64240885a.3;
        Mon, 04 Dec 2023 10:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701713619; x=1702318419; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cv5W8UxLCR/5ceJa4BXZdc/7xUY5p3Shixmo6OvaNl8=;
        b=dv/oxZfYlx4nuvpHT/5eW4EEnM39xupw+h9W+mKjMbeuYujEKDcibzt876zmAUkpwR
         ++saqFFDQbJSe0dVBzhI7ApLPqdKnYjHNF80IroFFSToRiYsXgCvbOH+1B9QIbn+t4kE
         3sCKul2QSF3A5pjoPHVKXhFjAWhGwaj9UBJbaO+V9bGriC30sHXh4PkpjvInuUP4VdrZ
         u1lzVt1KHNP+wXFXlamHT6dPPn56ENNfgbxdcH7eEvUxa4QM4BJTryXKvuY2KOwGQ4ob
         PWdelQgld1a8f8jlxzUAxrMCp3Z2l/lNh0MACOmEVoZu+MvZvxGg9KWkRxaiYYWY6MF2
         emjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701713619; x=1702318419;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cv5W8UxLCR/5ceJa4BXZdc/7xUY5p3Shixmo6OvaNl8=;
        b=Vt46soV7AiO8EFr5YheCXM4MI1sJtSBK30vGwPItqVR7C6oURC1wGrNWL9K40mRAOh
         ALNv+LibA8VVkhEjCJ8cfYsF0wa3H57XCpXon5dbRoxUU8KSyhg6QrA3FhSJlaThvbtC
         EneVhuSJ6p/2wzEwCxqv2RhAO6ZKpGe/p8EFfWvYHLVLfbauGu5UUrxMc/gT+6duXyKy
         XI4l5c/ig2sS68UWQBF3H+pLC2njirK50ku7lQcY0RT+VucGA9caP0JIT38qH7mITumP
         4mkmkykdJvulilTMD0UpfmhzP3wQhvYVE/7RHRgaISytScpMQD9/xnxoz1wS+4HGeWmR
         Pz8g==
X-Gm-Message-State: AOJu0YxfrorewW+WXm3cT8nCwRQLAPjv6uvsUh0zHJUpeloPBQi0ermE
	j7wUBOuYLD82+wNIFBeyow2PXtAN5jGdqgkGbXM=
X-Google-Smtp-Source: AGHT+IHDD5RoF3kCsuQM1b2t3YZgwiiRD95GHo5n9uXPGJLfvqKzVllX46OCHT8qfyQ/Iw/ykvNMOOKfu8qZWH64NAc=
X-Received: by 2002:ad4:4384:0:b0:67a:d891:fd75 with SMTP id
 s4-20020ad44384000000b0067ad891fd75mr567320qvr.129.1701713618841; Mon, 04 Dec
 2023 10:13:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231204180603.470421-1-gnstark@salutedevices.com> <20231204180603.470421-3-gnstark@salutedevices.com>
In-Reply-To: <20231204180603.470421-3-gnstark@salutedevices.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 4 Dec 2023 20:13:03 +0200
Message-ID: <CAHp75VdxB+qEjLBq1M3Zfrh4_gnJOv70BRb1RR7+KeDWcPE6jg@mail.gmail.com>
Subject: Re: [PATCH v2 02/10] leds: aw2013: unlock mutex before destroying it
To: George Stark <gnstark@salutedevices.com>
Cc: pavel@ucw.cz, lee@kernel.org, vadimp@nvidia.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, christophe.leroy@csgroup.eu, hdegoede@redhat.com, 
	mazziesaccount@gmail.com, jic23@kernel.org, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kernel@salutedevices.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 4, 2023 at 8:07=E2=80=AFPM George Stark <gnstark@salutedevices.=
com> wrote:
>
> In the probe() callback in case of error mutex is destroyed being locked
> which is not allowed so unlock the mute before destroying.

Sounds to me like this is a real fix, hence the Fixes tag and being
first in the series.

You free to add
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

--=20
With Best Regards,
Andy Shevchenko

