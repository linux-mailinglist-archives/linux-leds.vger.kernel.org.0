Return-Path: <linux-leds+bounces-4499-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD3DA91821
	for <lists+linux-leds@lfdr.de>; Thu, 17 Apr 2025 11:38:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 67A3F3AE584
	for <lists+linux-leds@lfdr.de>; Thu, 17 Apr 2025 09:37:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8123F226CFD;
	Thu, 17 Apr 2025 09:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WZwVyPr+"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061741CB9E2;
	Thu, 17 Apr 2025 09:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744882690; cv=none; b=JSXJPtTK7sQflUKvtAJnTJO2lbv7cO6qpJK1e6towY3+Cla7QyX2CuKfEc3TWtXl+o5TzHajPEZtN3LoAydRo2APIeheVu2CQa+kIsj4kOfP40CAb/aBs/Mmsh9/ZG5fP7Gj4s/L2ZByKqCt05e8ZqDsSWZImlasdXlFcN6a44Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744882690; c=relaxed/simple;
	bh=pkuj8qhpuC1L8bJHEWeOX4XesGf2CgnOO2ZvKUdm6oE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mFBbgmw/kwrqBx2soaZh7qmw0zV4w4NQswiDLll0SiledfVIgKkxVdmQy7J6RYQIkt7CBiv1aNOB5jO2FZp1GTeaQsQJEuf0ooH/XYg/3+QlpQV9q/dTd9kAgDFqepjSGqwqbLE6WA+/TYQFOEA+X0jCb1iZpe0chyOubuo8CaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WZwVyPr+; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2ff6cf448b8so699984a91.3;
        Thu, 17 Apr 2025 02:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744882688; x=1745487488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zmAjcq1hyDWgD/CheyINUCmNxGBhGov0++8U9Vbpz60=;
        b=WZwVyPr+F2vrAdZHhzvfSLCIRMLTzkpq/a/S0lf8quHryo5gUDavjVQJozpVpczOwb
         3Gx/Uj/78vhWD/JtMEQJT5jTCNJWjewNBW0mqSdZ/BovclLPHDHX2azXnpTn97Ny8ZNK
         8yLzFwIBh9EToYJetOLinIpJSRTmdMdJ1jW32VTmx7R2SPa/OzBsuqagnv+YLI8aDdav
         3a0OHqAerzsg4MuXUBHuKAHb7+etgNXviXOanlkS+7UcQGBogjqhnzGNoYFwSU3P1+7n
         B6K0HgkARxPq86zxq3Y973tAT53jHAb6HvaJgh5l2/2dw6PQX/cbDBIpcWpdrGnGV38Y
         RJsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744882688; x=1745487488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zmAjcq1hyDWgD/CheyINUCmNxGBhGov0++8U9Vbpz60=;
        b=aMwyF1MJ7s9Qg++XDoZTVv9dT9AINq+T4j/m/lGlisltJyy8pmVfrHw3kIpxnnQt2Z
         nfTPkTi/vkkD9MPCf2u57xSu1MLuOjQWi/5qVQTsRBHoemjCSuvW0ayOFrf+8Hc+ZFUv
         sS6coCfLTrpj59oEM4qZlmbXoTFS2N96k0blPfn5lOHCmVfRZexYcFwdKE3thD4DTfQC
         8g6UBT2SaLz3VpZkdfs68Uxa9ezocno6lMWElsLBlFDh1sRVU5PiNunkLk0+8KmEnO+2
         62c+WGLPgxde7tr6QB+HLShPYAvRaUUdXsYW1PX8q1D2MsR1+mXqJuQh2GQ8vgKhbC/5
         kI3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUuHwxW+iLUlXzk5yPXKSCIA7v/0TjuCsf1pVADYuDu2pT27eOOa0xYUkoKhX5pFqohfpuuZfcaA+sqK8ZE@vger.kernel.org, AJvYcCVvKDtzxymOoABIya+8VjcZR6DCOdruT9E1uz9Sm6+rX1HiIdapX1MhkZkrxILnbB61EitXVhIN1oaQxw==@vger.kernel.org, AJvYcCWOdRLA5orkTByE/cyXfOtBNr0o5uZJMOQNXdLKsGpU2DcU1N4YRvxQ/ldJpwGb2T5DUilgB4non3Eo@vger.kernel.org
X-Gm-Message-State: AOJu0YzJmVDz6QigTdlsFt14vkRMNrAkpDFtN7JIMMdtTXWf7XnZWKqp
	Co/4ZcyGsAnKh+oC7JrbEQe6/iIKG+83KYdpU+oXAvLZIG6NvAIQDAseQg==
X-Gm-Gg: ASbGncuZer3Tl3fbKtCo3NuYcDoWFLJGqRX/Hng2M4l0/9MJtxmJw4A3iQk2IR+prE8
	podfxS2ydQk2MD5z2xwWN2sq1lDHfAFJoJEmh8fPyZDx3SKFi/emh54Cp8crW6vCqE+qpxhYz6Z
	KQIMvh1dDuG0V5Ar+yyYMJVmIEQWj8XUgfrXCaRFSoio6di8GrlOZhj39bsNXUQrweKnCUa9T6v
	oruKFewqsTiBsp8rtF6M5cTPBQEAI35Djn5QEVl7My5cIjwi75hTDTl0/hx7Nf3l6YH8HStqx2G
	i3m0KKcufb25ij9ltUrm0FaSpFD/uTvj3BsUIbsEWGoIFWUVurwEQQ==
X-Google-Smtp-Source: AGHT+IFV99Y0b6SjR27hTssQJUN2m5u9i+nWFFtBzvYZk1ruGbbNl9e+iP0/hxiAp+Uqq/ElDMOJWQ==
X-Received: by 2002:a17:90b:2e10:b0:2ee:e945:5355 with SMTP id 98e67ed59e1d1-30863f30453mr7027126a91.19.1744882688148;
        Thu, 17 Apr 2025 02:38:08 -0700 (PDT)
Received: from localhost.localdomain ([171.255.57.44])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-308537b54d1sm4016523a91.0.2025.04.17.02.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 02:38:07 -0700 (PDT)
From: Nam Tran <trannamatk@gmail.com>
To: krzk+dt@kernel.org
Cc: pavel@kernel.org,
	lee@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/5] dt-bindings: leds: add TI/National Semiconductor LP5812 LED Driver
Date: Thu, 17 Apr 2025 16:37:40 +0700
Message-Id: <20250417093740.8466-1-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <878933d0-7062-4b91-ac32-efd5ea190702@kernel.org>
References: <878933d0-7062-4b91-ac32-efd5ea190702@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, 17 Apr 2025, Krzysztof Kozlowski wrote:

>On 17/04/2025 04:06, Nam Tran wrote:
>> 
>>>>
>>>>>> +
>>>>>> +patternProperties:
>>>>>> +  "^led@[0-9a-b]$":
>>>>>> +    type: object
>>>>>> +    $ref: common.yaml#
>>>>>> +    unevaluatedProperties: false
>>>>>> +
>>>>>> +    properties:
>>>>>> +      reg:
>>>>>> +        minimum: 0
>>>>>> +        maximum: 0xb
>>>>>> +
>>>>>> +      chan-name:
>>>>>> +        $ref: /schemas/types.yaml#/definitions/string
>>>>>> +        description: LED channel name
>>>>>
>>>>> My comment stay valid. I don't think LEDs have channels, datasheet also
>>>>> has nothing about channels, so again - use existing properties. Or
>>>>> better drop it - I don't see any point in the name. The reg already
>>>>> defines it.
>>>>
>>>> The channel was named for the output channel to each LED, not the LED channels.
>>>
>>> I don't understand what you want to say. Please explain why existing
>>> label property is not correct here.
>> 
>> I understand that the label property is deprecated and that the preferred approach now is to use function and color instead.
>> However, in the case of the LP5812, which is a matrix LED driver, these properties are not a good fit.
>> The LP5812 does not associate each output with a specific function (like "status", "activity"),
>> and the LEDs driven by LP5812 are not fixed to a particular color.
>
>Then use label instead of creating another property. If label is
>deprecated, how creating another property which duplicates the label
>solves anything?

You're right — creating a new property like chan-name does not help
if it duplicates the purpose of the deprecated label property.
I initially created the chan-name property after referring to the existing leds-lp55xx.yaml binding.

However, based on your recommendation, I’ve decided to drop chan-name and the entire subnode as well.
Additionally, I will add the vcc-supply property as mentioned in the last email.

Would this be sufficient for me to submit a new patch?

Best regards,
Nam Tran

