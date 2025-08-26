Return-Path: <linux-leds+bounces-5313-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C63BFB35140
	for <lists+linux-leds@lfdr.de>; Tue, 26 Aug 2025 03:53:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA5661B215CB
	for <lists+linux-leds@lfdr.de>; Tue, 26 Aug 2025 01:54:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F32841FDE19;
	Tue, 26 Aug 2025 01:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TQ2YqKZM"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B2E1DA55;
	Tue, 26 Aug 2025 01:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756173225; cv=none; b=dOe3CfzYD5KS30Gfk+I3jfkVWCC4K0u3WeaAlvni+hFtTheTjo8yf+4aT3c4lBI5Pe+SA0Z5GOjOR5gZpmqueg/nLeK1KhQzlQC21vTfbVxDn+ZiWjpA2tJyd60U3mruuWnS/ABP08E1GGmnG7I5N7vir8r9FCLL4fqIPQhJUe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756173225; c=relaxed/simple;
	bh=51wTGsY/9vGT8UdadYFMSJo5KAiyOvnPp7Uqh4lE4Wk=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=JWGtm/TcJheGybV9lI6lHt8EU8Irzp71MbgfPFaFdFQkVsLhMA2giDtdL4eCtBBD+9iIZ9sUQ3ORnjhSUm0c8Uoq0Sw3XlYWj1q6rwgXYmj0LYLzhQe69IsS+L0/s5omywr6d02rJz71+tnfK1gPSDm6RXKFi9iXdrAIHZCo2XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TQ2YqKZM; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4b1098f9ed9so37747201cf.0;
        Mon, 25 Aug 2025 18:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756173223; x=1756778023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+Re0dfJaJNiHta7ORGnneGiLSwhvnswPXnnAgtyuJOw=;
        b=TQ2YqKZM3/5bTiVQa7UqmVqwjFRsaHW7sGUlpBxufjAaMCqHAGBJWlZbvxDHQHaBL/
         c3aq/p3Nujp8EyiJkLly1ZjMUWGcfD+hKF9Cj3s0yK1+MMOG+ey8/wriHsAEK1Vwc/SO
         5D+/swugRfpo6atoZt2YxNNypFJ0w8n/OscXNqXaclev+EH23nlCKeI2vVfrP8ttrwJk
         hcRWw4qlCpOOxJk7eSYhXwM54qjny/AXO5ZD1ROPM8ZsLLM0IMQL/y3eYPHS7fD/E4IQ
         1k4kfe7BfQcFveYoey0GTloaUeXqoJtLoxJY44fPj3Vq6eV1oH2H50Y5eQsxdXbClnLy
         33XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756173223; x=1756778023;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+Re0dfJaJNiHta7ORGnneGiLSwhvnswPXnnAgtyuJOw=;
        b=M05NbXIBVHZT4aDbK6L5oeUDPmVewaRsDCcUJzjjdAW7x1W65hxpLAsToxtodH4RGw
         KrywyJDbxz6T90NiX8Ejk7IbZwTmTfGNyZOAmwrYpfE/MKCNzICfvzuzoN2Ua0XhQCUa
         5WtwUjelwad3WkDKeVmqXFqTXgKzUtFtq7fZqNlbtBTLgJCMMly7uWKqCoNNaVZ6Smpg
         fBNQLl0KABgEbcueGNFYIg0fEbDSjojlbYqaQcf9jUxCFp1ZDSm6fmHYzVcmV+OD9tix
         t3/q3DJ2lLKlHoWX7hjWre0l156o5ATAukpkHWz15CgypJx41MJSiud7ik5+g0XgEpR7
         SEEg==
X-Forwarded-Encrypted: i=1; AJvYcCU+9WGb1W0xV4VFIx0/FLuWdqDkKDyf6Gh6AiEgJy95NJmw0U6wTTDqToKKy7/ze3lJHVveBr1KaF2mpg==@vger.kernel.org, AJvYcCUXFdk1pbQx1wLcVFjGpoqG2puLqWLCWojSqp/iBDG0ud9hozMEEUyvVJi1geBYZt1PYZ0C+GF5G3KNgMk6@vger.kernel.org, AJvYcCWBxDQhJ9G0G0sTZnCbIcrQSQPOQQnBzeK5A5htdXc+gGTnW2orYFiB0LzqHxLI9nZ/GSNH46RMYptj@vger.kernel.org
X-Gm-Message-State: AOJu0YyPEyPTO4nP4VtrXR8khHygJSGPmEUmNU5zRa4Z8hgIo23qMD6M
	H+ClspT1kcoVRLDfSAMLIzTt/dd+GdlZ9DWLLIG7/8U5f60UiZN3s9lQPgSfQd+f
X-Gm-Gg: ASbGncuPdoR+uLtJzE1hN4yfNc8tQIRFf581/ogOLvsR4FO/cy4GRpa4ZtSgEgLbHVQ
	ZI5xKacGE5RAKyITxH80F9/IqicYzxhqY//pj1GEm9L27uNIqh2eHawI1+R1ulf9v07EzHaGB6K
	N5BRj5/zDkwNg5/4Xm5E3JO7vPo40iBJbI9d6c/XTCjbqV/jSjdXfdi8DwjHJgCFOfRnEXc2yUB
	gJQ/6HagywL5UE2h7K0wWZE8+3CnsgL/S4m2DxHiRv5Cj1W2wuOcd/iPvkHIr+E13NApKGfLLwU
	tS7hsT27NJ5gBA5PTNRg1n3rrAQvvAWwLO0RmSgkN1S+2WJPw9EnwlvSSGXEnTrrGTFpOgfYAZV
	9Alr7rhrwt80XDAbDnGaVv0PloIGUEWrHMZ0J1YdRqOaZypJqsiNWmndahSw5xY89Q8YzaQ==
X-Google-Smtp-Source: AGHT+IH4XjSi6yyoGMKBUjhavQKmCxMdFB1PslcgxcUyHDGfAIwjahX67UxrFjo/Q2LgEMQ8V/x1cQ==
X-Received: by 2002:a05:622a:1a12:b0:4b0:d8b9:22f3 with SMTP id d75a77b69052e-4b2aab20c15mr165740911cf.53.1756173223003;
        Mon, 25 Aug 2025 18:53:43 -0700 (PDT)
Received: from [127.0.0.1] (modemcable197.17-162-184.mc.videotron.ca. [184.162.17.197])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7ebed8902fcsm601252985a.20.2025.08.25.18.53.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Aug 2025 18:53:42 -0700 (PDT)
Date: Mon, 25 Aug 2025 21:53:42 -0400
From: =?ISO-8859-1?Q?Jean-Fran=E7ois_Lessard?= <jefflessard3@gmail.com>
To: Per Larsson <per@palvencia.se>
CC: Andy Shevchenko <andy@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v4_2/6=5D_dt-bindings=3A_auxdisp?=
 =?US-ASCII?Q?lay=3A_add_Titan_Micro_Electronics_TM16xx?=
User-Agent: Thunderbird for Android
In-Reply-To: <20250825210836.71fb0d0d@rpi>
References: <20250825033237.60143-1-jefflessard3@gmail.com> <20250825033237.60143-3-jefflessard3@gmail.com> <20250825210836.71fb0d0d@rpi>
Message-ID: <73A1F250-CBB4-4415-85F9-72599366E271@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 25 ao=C3=BBt 2025 15 h 08 min 36 s HAE, Per Larsson <per@palvencia=2Ese>=
 a =C3=A9crit=C2=A0:
>On Sun, 24 Aug 2025 23:32:28 -0400
>Jean-Fran=C3=A7ois Lessard <jefflessard3@gmail=2Ecom> wrote:
>
>> +  - Digits use 1-cell addressing with explicit segment mapping
>
>This new digits layout introduced in v3 implies that a
>different segment mapping can be used per digit by a
>single display/controller=2E Is that really a thing?
>

Board manufacturers typically use consistent patterns across digits, but s=
ome
use matrix-transposed layouts where grid/segment relationships are swapped
system-wide=2E The explicit coordinate mapping handles both standard and
transposed configurations=2E

Bottom line: I am not aware of different per digit 7-segment mappings on a
single display board=2E

Best Regards
Jean-Fran=C3=A7ois Lessard


