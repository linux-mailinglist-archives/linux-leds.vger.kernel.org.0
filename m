Return-Path: <linux-leds+bounces-5170-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3036B157FE
	for <lists+linux-leds@lfdr.de>; Wed, 30 Jul 2025 06:09:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 578027A3B46
	for <lists+linux-leds@lfdr.de>; Wed, 30 Jul 2025 04:07:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA578132122;
	Wed, 30 Jul 2025 04:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kpRt4jj3"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6B38BF8;
	Wed, 30 Jul 2025 04:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753848548; cv=none; b=HMfWwftk+WcHhyEOd/KBcPn4PNuCfxtGvRIhoCPUMPM08U4WBMQRt8MsPtjQX/t+gbHhp54iQg/fvWLzuFDI7AdiNXQP7OQF2jH85LhDEkaMav3sesEUxgEao3g/Ca+FiDfrJPxGFhO+7Gy4hmMIfJZ260EkqylKoipX4QfBHr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753848548; c=relaxed/simple;
	bh=UYqOqGuz3RQB/1I0e9N/8RV9Ug27JtvbaM2Jg2zYuls=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fU22/N9VyoHi7JWXNZ33jluZ34P/smR6Ji0G+4QX6+lJyJJqZUgMZo6+ccGuI8x4HmUPp5ijeSd9e5lB24rDB+Bc5Za2wHrnk/iunsI/M1xpcm1E4Yx+H8IpVHJTLKhdo1Fi6nVQQRpkSULDULfdgYPXX+DcPO26lwgaVrD8dR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kpRt4jj3; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2401b855980so4728715ad.1;
        Tue, 29 Jul 2025 21:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753848547; x=1754453347; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cj9ajIDhRnpei6pRoL3pp7Yr4t10PB2LGAVWuEtdcxo=;
        b=kpRt4jj3zvP0P2c1wKoPKVjP79gkAgqg3xyJA1S8FC4fwRsYFUE0Y8URqHohPtony9
         T8t55/djxtZ09yewCYbgILvV0a0SeJVz5Zb1DylLvRWpnf5MKBuF9WRNt0EopY42nhrX
         ieVyXWdUsiL24Bt4A2DzNoLmL21491pWPTKQFRAXrJgbt1rHj2vJEGbK6zH2ezcafhu2
         /2ytu3kJbxDSrHUtBbMBFoHmY8MWvv7luSRdCh24MgmeSb871/gUuegDmGze7ptsNZSE
         eUNn4rZxYV1foLteOcuVws5Sz7dDnubpL918sTyQJHjrGsn3pnd9uMQatxlHxNL0SxBi
         T0wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753848547; x=1754453347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cj9ajIDhRnpei6pRoL3pp7Yr4t10PB2LGAVWuEtdcxo=;
        b=AWkA2vaUhJ4hsAPo4jqBFwwyFjCt1G3L55j57D4bF/GYyI6azpkYWmlsIkoBkYAn7Y
         ncB6Z8WacVLxhs2i5FCBWN61CSlKTcqgAlI4GknC2vTz2rfE8PC+rpUxeYrUG4tStdJ3
         cFn8u9UN5mbUkWVNgVJHr0yciBqGLhQxbmECgUh0uV47jzk2+KKUXMnNjLXGcFrASzEl
         bLmrzXtKK5sjRIoAZGU4kPLx4Vk9BovjW5rHk4971m1kQYeL7PYnW9Gcg4MkIzi/xBXi
         tS39TOA6t+hKnuAAToqAKGnYkxf9Cfqd87qe3qIaHwVi+pYjsf59+dDL4Ws188/pVTNq
         Kr7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUGx74bQ2E3r8iIcNMFSCSHFU2injZXT20t1YA4m4qx9MxLffCZNGoy17X18G2+gj8Hy36wOzgH7lZ88Q==@vger.kernel.org, AJvYcCUkRYdmq1nEqe6InN2rT72TIdJywQkbH1NnkWH17KLEwtb5ZwBAPDdIUeYzN429LyR38z6BsAeMfN46@vger.kernel.org, AJvYcCWRgZaAciJKyHgb6Uvh07CgMkXb2ObI7gxbPXwpS83V8PepXueQr4zeyEYjXf2ZOPgkmXKejRrwRg9c@vger.kernel.org, AJvYcCXK6w951dYMp/w1xanrd3z3JL2Q7CjQ3rnvZhIWNIdkPuuNQhRkDMzK/uUJwS7BC/AEe6LBFrIYzc+L6F+Z@vger.kernel.org
X-Gm-Message-State: AOJu0YyjEXncw7yLjKIjriNVJbr1GiDA3OtlU7oavRz+Py0AlN44f79k
	fzSVSD2H501Tsmdtf2+9EcptqbO2RmuC1wDLX4GJK6dXJSFLYUeuSLL4
X-Gm-Gg: ASbGncuZUXYSHSIdY/TBpaX0ZCzHB1ff+znRaUhPTpeclJA0AAB+W/a4qF/tHYqe68d
	0MpU/HL6MZyFfKZ6xAGCsN2kjwMbGhJQJQIuO9ryuL2KZwQeobDNYop4O2KrSSoemq7TUhYjoV0
	854Uon2FbV39fxtuauI8EktQk6bjWsAPYIZj5HYtsURteVdfYHlS0LMZz58wuvsjCdJeZnAYAb2
	CY1wvPoAauZ7I6EasdpSObt+jETXKa8G3hweIXm6R0N8BfBxbuj1pVqNjGvWFEXjXS3CTYR7obd
	Uj3qndJnZUHdQ0U/BuQXKWcOcjru1rxohY/3hIrdtMF/P5ugHPw7WVk+euLfvh/MmoqcPEKAhbM
	fcn3MXiHy/Si3K7vrE8UMaFds2iBlhN3pY547nQ==
X-Google-Smtp-Source: AGHT+IG+0aX0hOCV4OeeVvGkJll2b1yJrZSMdzfO1y7YGU3xKaAgxSilaLS1qeMkttUOSRtxsHC4iA==
X-Received: by 2002:a17:902:e541:b0:240:52c8:2559 with SMTP id d9443c01a7336-24096b264bfmr27283815ad.45.1753848546623;
        Tue, 29 Jul 2025 21:09:06 -0700 (PDT)
Received: from localhost.localdomain ([171.254.200.118])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2402bd30cacsm56849185ad.66.2025.07.29.21.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 21:09:06 -0700 (PDT)
From: Nam Tran <trannamatk@gmail.com>
To: lee@kernel.org,
	krzk+dt@kernel.org
Cc: pavel@kernel.org,
	rdunlap@infradead.org,
	christophe.jaillet@wanadoo.fr,
	robh@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v11 2/4] leds: add basic support for TI/National Semiconductor LP5812 LED Driver
Date: Wed, 30 Jul 2025 11:08:39 +0700
Message-Id: <20250730040839.125683-1-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <bc24e841-94a8-4ca8-9f69-90ec32fbbfca@kernel.org>
References: <bc24e841-94a8-4ca8-9f69-90ec32fbbfca@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 29 Jul 2025, Krzysztof Kozlowski wrote:

> On 28/07/2025 08:58, Nam Tran wrote:
> 
> ...
> 
> > +MODULE_DEVICE_TABLE(of, of_lp5812_match);
> > +
> > +static struct i2c_driver lp5812_driver = {
> > +	.driver = {
> > +		.name   = "lp5812",
> > +		.of_match_table = of_match_ptr(of_lp5812_match),
> 
> v11 was okay here... now you introduced errors.

Thank you for pointing that out.

You're absolutely right.
Since the LP5812 driver is DT-only and doesn't support non-DT probing,
using of_match_ptr() is unnecessary and potentially incorrect.

I'll drop of_match_ptr() and directly assign the of_match_table.

Thanks again for the review!

Best regards,
Nam Tran

