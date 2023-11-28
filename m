Return-Path: <linux-leds+bounces-191-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CEB7FBE70
	for <lists+linux-leds@lfdr.de>; Tue, 28 Nov 2023 16:48:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 49E6E281C98
	for <lists+linux-leds@lfdr.de>; Tue, 28 Nov 2023 15:48:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E43081E4AC;
	Tue, 28 Nov 2023 15:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LKI/gTL+"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2560D10CB;
	Tue, 28 Nov 2023 07:48:10 -0800 (PST)
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-67a0d865738so28351846d6.1;
        Tue, 28 Nov 2023 07:48:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701186489; x=1701791289; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0TYvaPLaWqylO8fpxwWZAfUUL/mjgHuianw8ggEn4cg=;
        b=LKI/gTL+NQzIErI0zdc9SZtDUvuA7raKu855/tQZdfAO+il52wLB3nnKjy8wBYamD7
         GC8zD5CApqkVS/8fjFTuVkVu3g1zO+uq0Gd6+cF0QnNyeu6435EFaNWwkfO75Xzx7AFy
         ckpP49b7Wat5ILQFCAJj6RABf8Vw4DmZGyiobNzIvg7Zara4VmK+9x7VRPD3nN8k9yzn
         8FbX7JVo2geDSat95ZPY3rioXoTQiE5MeDnok2j5X+EFDMUZ0zx1+Di2VQ/cGksffc/U
         9xyxq/mKTPz7RmQ/uw1xG/xKf65U48fRIlLocv6prkl/LdXDE/HysP4o1ARIMs32S2l4
         1b6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701186489; x=1701791289;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0TYvaPLaWqylO8fpxwWZAfUUL/mjgHuianw8ggEn4cg=;
        b=iPsLPLhI0mOK1E+jqy2EYhinFnnZCzCf96ZU072ebr8pr9yh+G9td775ejBcdE1pwp
         W5nhsB5erUQPzMVik1EjI4ee/34kQEiXcYVxQec+HKST2u8iU9U3dxAHxrro7e/j+0s4
         U+vz12RAidkZnkTfSTW8SY/N+D9MLGnNF2QImDlaKUA8HeR7YwhxMbHTV4pEd8KadmLv
         LptLQI6YndabOkP5YpURNn3ny5L7/d31MjJ/bgdkbUUcrzme9Wr2s2myprEhhK8lpEMk
         BfOmB8bcXWbeJ+z6F6kqGKlBHxPw2PW0D/Wc1Kvn0CitfFzcVDItPLTteyRACEzsUP2U
         IX+A==
X-Gm-Message-State: AOJu0YzPmmagq327t+KXlnhbIgXp/5sO09UVpLaP2eEXZ/Ao8YnBnufH
	pb4P4gFaqQWafQzm7gX05+XZbj4wONX6/LshcOlsEvW0Las=
X-Google-Smtp-Source: AGHT+IHEJH63BKC4POAhzC7PIHCiwfBPYGvoug2zT2Pk25E3Rg25NT3ad/wnNliAgaqPBPz5UNNH8zNYNOp9URa56DA=
X-Received: by 2002:ad4:5ca7:0:b0:67a:3a68:91dc with SMTP id
 q7-20020ad45ca7000000b0067a3a6891dcmr12571448qvh.28.1701186489278; Tue, 28
 Nov 2023 07:48:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231125200519.1750-1-ddrokosov@salutedevices.com> <20231125200519.1750-5-ddrokosov@salutedevices.com>
In-Reply-To: <20231125200519.1750-5-ddrokosov@salutedevices.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 28 Nov 2023 17:47:33 +0200
Message-ID: <CAHp75VciKCGcaRvask-q4pCMY3iuRf71qiVCNVqybGuN--kqPw@mail.gmail.com>
Subject: Re: [PATCH v5 04/11] leds: aw200xx: calculate dts property
 display_rows in the driver
To: Dmitry Rokosov <ddrokosov@salutedevices.com>
Cc: lee@kernel.org, pavel@ucw.cz, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, kernel@sberdevices.ru, 
	rockosov@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-leds@vger.kernel.org, George Stark <gnstark@salutedevices.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 25, 2023 at 10:05=E2=80=AFPM Dmitry Rokosov
<ddrokosov@salutedevices.com> wrote:
>
> From: George Stark <gnstark@salutedevices.com>
>
> Get rid of device tree property "awinic,display-rows". The property
> value actually means number of current switches and depends on how LEDs
> are connected to the device. It should be calculated manually by max
> used LED number. In the same way it is computed automatically now.
> Max used LED is taken from LED definition subnodes.

FWIW,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

--=20
With Best Regards,
Andy Shevchenko

