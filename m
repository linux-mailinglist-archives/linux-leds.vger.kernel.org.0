Return-Path: <linux-leds+bounces-5956-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CAF2C26836
	for <lists+linux-leds@lfdr.de>; Fri, 31 Oct 2025 19:02:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 372AA401805
	for <lists+linux-leds@lfdr.de>; Fri, 31 Oct 2025 17:59:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 048F7350286;
	Fri, 31 Oct 2025 17:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hvTPjRhV"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503FF329361
	for <linux-leds@vger.kernel.org>; Fri, 31 Oct 2025 17:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761933585; cv=none; b=tng7d4XmD1+pySzSVmbJFgTJMboxcUDtCnZPBTZXMb8Esix57J72qvZtXDl+fzp0W1QZgUR0gWMfxbxPHV640UpG/pEEG2eKbcwLhc328Vw7doUIVmQDe20pgvniCzrGzyYFl9/+eQ4p1z/4bDFf0fdQbTrCzaZ092uRfgLrbL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761933585; c=relaxed/simple;
	bh=iOnu8YXSm0hYmgtxCKnYF6BGiSqmzUrc4a0lLm+asfc=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=d7aJmxUXY1R1efUFLj5YSUfc6zPtzeVQ1VM8jN4c2hOdCLZNzrweSIkcS75Uqye0cvksdNvUQ8gXRJoDpDrP59lIF3YUrJxuUsenY+KgUq3V2dvKXHHwiBxWjulOwyk0CqLtW0sA4ZM4xiL19Xc4G1vhHtlVTWk/g9jhs/fgZPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hvTPjRhV; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-89ed2ee35bbso355881685a.3
        for <linux-leds@vger.kernel.org>; Fri, 31 Oct 2025 10:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761933583; x=1762538383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=C9TvLVEpUHB355SxMPUsmkhK3XU3SxzE+SMxZSn+ZNc=;
        b=hvTPjRhVFlGpZiVnMX3mQb8kzi4Vcjx5eYucVtRoun9kRWZH+ZODffzNS3m42Pcuhh
         32UVXzxRF9LkgYlvPygw5SP3gmtyzYZ4LMLcguU+y7z2v6arRsM67InRvsZ13GIuoOQe
         4swanEh00FKFwcXkv7bglKBgv87mfycPA8XfFSNMaS8BCn16BdOAj9H3TKRvtcuVQzgq
         Z6K+RGoDNv3byAPNiw5xwtc+pjUaNKtxAW3NPNi+Yp7s+fxBrmAkqTzK8fOGmKz/cy7j
         nlOrHP/v1YJTI9sVwOOZcjf5sWcNd5z+6n1vF15bzdzorSmGd+wk4gvTBNTAznmGpsKz
         8vQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761933583; x=1762538383;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C9TvLVEpUHB355SxMPUsmkhK3XU3SxzE+SMxZSn+ZNc=;
        b=cKlOpyYOODD9Zqk/TUyT1r87wHH5LkiGqWnNWeMtKxKbHuaOIT8utadUVI8MpLRYIj
         dN5VJveQq78rf0z5iPaLCq/HSqxASoP3mNnxbgrYTscHblrFzVZcNQon6jzocd9sy4y+
         x7Z4zW2xqBLo048lMYlBPHqKA6k1iVu/ldDtp1C5Ie0LMnKSAqYqSngnNoRaFNwwPzcW
         crMvmsjwbS5GIGcAWH9s6xA10oVVOQiQhRDyydp2dKr/VgDAJocvW0ijn8OpQqcchSVk
         tQ0OVHeSlQa7RKS3PCztCP7wv9Z35xwlT3Z/ZVlO/izepbPxsHxqMq9VWdV69A9kLoKQ
         3DqA==
X-Forwarded-Encrypted: i=1; AJvYcCXmnqBnwcG06R3gsqmwFP/o/kq+pBUt/Fx/wkfmif0Tt9c3DEmfDwHyczioGiO9ahTSenNBHhSTFqOz@vger.kernel.org
X-Gm-Message-State: AOJu0YyxY0v65RZGQ+WNZWIc+vmgff71azVNErT7OGHpX9W72+7T+mny
	6/I+3riYWdr5U0j9ol3PAzFVCucczhduIOt0/sUrNznrECU85Ry/Uxt1
X-Gm-Gg: ASbGncu3Ulwx/r5FZGan3qQLJSiIPvOTXz4B9vm38u/uHkenlrUwQEjDMObq8x69Eoj
	5q5SOkkhnKaPG0dOpY0DvImpHrlfQxRRf4hMVHTMLgsBEqjIZPK/5jzltlB9W9/XzOGxvu3q+5O
	X9KYRPOV6Bii21EfEZ1jKgrKC2wsRb/gk6fOrIlhztqAjTomL+CWGfRJfTeBocXO5hkkAlFa8yy
	yeQxQyq0RRNl//eS7k+ozj5mm/qdtls6LJ9BCDpISgfbRxWRATLOM4osob3Bumtke/YJe+7TGQ/
	zM9jNjaFqv0Fh3O21dBngmyzQr7FVBY6tT1c0hdcv7uR0n+DKpiLtEPwaxqhG3YyUCUu6rzDIns
	+K/gro2DQ8liTmXD5FtTHd9NvYS3tAf0phMxBdNBORVdetWnr+Dl58jqyDEvhZ0APQm4CvUhx5B
	wGwdUNUC58/PdFq0AzyFpfnCab8g91PnsNKNZnjSqSOn9vzWl/4V4mqm/aa28=
X-Google-Smtp-Source: AGHT+IEosKF/hSeBeiZp/vvJLPozX0TbNwZj+ymvZVV1kTVbfgpxF7BbWMYqF93HykWROEe4RFcMSQ==
X-Received: by 2002:a05:620a:4004:b0:883:7309:c0eb with SMTP id af79cd13be357-8ab9acee443mr519487285a.41.1761933583004;
        Fri, 31 Oct 2025 10:59:43 -0700 (PDT)
Received: from ehlo.thunderbird.net (modemcable197.17-162-184.mc.videotron.ca. [184.162.17.197])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8ac03f4d585sm148632985a.56.2025.10.31.10.59.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Oct 2025 10:59:42 -0700 (PDT)
Date: Fri, 31 Oct 2025 13:59:39 -0400
From: =?ISO-8859-1?Q?Jean-Fran=E7ois_Lessard?= <jefflessard3@gmail.com>
To: Rob Herring <robh@kernel.org>
CC: Andy Shevchenko <andy@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v5_3/7=5D_dt-bindings=3A_auxdisp?=
 =?US-ASCII?Q?lay=3A_add_Titan_Micro_Electronics_TM16xx?=
User-Agent: Thunderbird for Android
In-Reply-To: <A137AD5E-2D4E-4C1E-8A71-EF90E60D8F14@gmail.com>
References: <20250926141913.25919-1-jefflessard3@gmail.com> <20250926141913.25919-4-jefflessard3@gmail.com> <20251002024431.GA2926696-robh@kernel.org> <A137AD5E-2D4E-4C1E-8A71-EF90E60D8F14@gmail.com>
Message-ID: <7F647662-59AF-467B-8998-E870F114BDAE@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Rob,

Thank you for the review and Reviewed-by tag=2E I've addressed all your fe=
edback=20
except one item that's causing validation issues=2E

Le 1 octobre 2025 22 h 58 min 38 s HAE, "Jean-Fran=C3=A7ois Lessard" <jeff=
lessard3@gmail=2Ecom> a =C3=A9crit=C2=A0:
>Le 1 octobre 2025 22 h 44 min 31 s HAE, Rob Herring <robh@kernel=2Eorg> a=
 =C3=A9crit=C2=A0:
>>On Fri, Sep 26, 2025 at 10:19:04AM -0400, Jean-Fran=C3=A7ois Lessard wro=
te:
>>> Add documentation for TM16xx-compatible 7-segment LED display controll=
ers
>>> with keyscan=2E

=2E=2E=2E

>>> +
>>> +allOf:
>>> +  - $ref: /schemas/leds/common=2Eyaml#
>>> +    properties:
>>> +      color: false
>>> +      function: false
>>> +      function-enumerator: false
>>> +  - $ref: /schemas/input/input=2Eyaml#
>>> +  - $ref: /schemas/input/matrix-keymap=2Eyaml#
>>> +  # SPI controllers require 3-wire (combined MISO/MOSI line)
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            enum:
>>> +              - fdhisi,fd620
>>> +              - fdhisi,fd628
>>> +              - princeton,pt6964
>>> +              - titanmec,tm1618
>>> +              - titanmec,tm1620
>>> +              - titanmec,tm1628
>>> +              - titanmec,tm1638
>>> +              - wxicore,aip1618
>>> +              - wxicore,aip1628
>>> +    then:
>>> +      $ref: /schemas/spi/spi-peripheral-props=2Eyaml#
>>> +      properties:
>>> +        spi-3wire: true
>>
>>You can drop properties=2E
>>
>
>The issue is spi-3wire is defined in the child node of spi/spi-controller=
=2Eyaml,
>not in spi-peripheral-props=2Eyaml=2E
>
>Removing properties did not pass dt validation=2E Am I missing something?
>

You suggested dropping "properties:" in the SPI 3-wire section:

then:
  $ref: /schemas/spi/spi-peripheral-props=2Eyaml#
  spi-3wire: true
  required:
  - spi-3wire

However, this causes dt_binding_check to fail with:

'spi-3wire' is not one of ['$ref', 'additionalItems', =2E=2E=2E 'propertie=
s',=20
'required', 'then', =2E=2E=2E]

Unevaluated properties are not allowed ('spi-3wire' was unexpected)

It appears the schema requires "properties:" to recognize spi-3wire as a=
=20
property constraint rather than a schema keyword=2E Should I keep the prop=
erties=20
wrapper, or is there a different way to structure this that I'm missing?

>>> +      required:
>>> +        - spi-3wire
>>
>>With those nits fixed,
>>
>>Reviewed-by: Rob Herring (Arm) <robh@kernel=2Eorg>
>>

Thanks for clarifying=2E

Best regards,
Jean-Fran=C3=A7ois


