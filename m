Return-Path: <linux-leds+bounces-6323-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D682BC8B151
	for <lists+linux-leds@lfdr.de>; Wed, 26 Nov 2025 17:55:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 949C53A2AE7
	for <lists+linux-leds@lfdr.de>; Wed, 26 Nov 2025 16:55:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF4D333F365;
	Wed, 26 Nov 2025 16:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KCJDGi4r"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33EAB29E112
	for <linux-leds@vger.kernel.org>; Wed, 26 Nov 2025 16:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764176141; cv=none; b=pRcFGz8MELPeVN5lnfiQpQspvn2KJCz/pPDnhvq3yXzt5QGI6R52E8dPfh8stIrmGe7tYIj0Q5uJEvP3anAgZllVSLUBLXWg5m9df/OBMGM2QQtjEujGk8vvoGEEUZExT12hPMao1yZpXwE1IhLujj6IwPe3X9YT0b5xiGzHB3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764176141; c=relaxed/simple;
	bh=3Gc11fg7hsjFljk/JqN+H1npRWBl2dMAD1W7UL37tOY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=carc3x4ohjH6sAb4Y7GoKmfngLQ8qJSltmrBdXTpeKj4IYp5uo+JmpTZbmb5J3WTtJWDCMoHf3Ew2VxpV8DRwk0dQC/hSO+CP6bwEVBMIGPnp8CSe/GR0ylJ6JYqHaAph08Ov+I1/Mj6AiwQzhQhKEz53I3yDMPKX3eYPqizeGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KCJDGi4r; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7ad1cd0db3bso6070318b3a.1
        for <linux-leds@vger.kernel.org>; Wed, 26 Nov 2025 08:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764176139; x=1764780939; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YsLR0RJnm38Fp5r7CqZvtnDjOXjaQRJuirTuBdqGYYg=;
        b=KCJDGi4rY4QXX2mUg28fMahdbCOHR5IMbRTT4p6p+Tw1trwhatcTK9D00Irh9JGjld
         +fxqyKFVNLlzmQ8dPT2dsEy7YdSWKxRr+KT40peMNUnNnBdBS6dDNtTO8P9XT0R0VfuW
         jdyriwVOYhVUSdsuuTuVdawn5sXUone/FHQTLOfr6O75vLdTH0M5wCKS/QErgP8qUgiB
         +wMPWpM/eQxiAj7Sv8t3T33FO4ciOFp1zKjD60BvfsGYshcYmOgro6ksRCTxWlfFGUEI
         OkL3lo5VIubyRXLRB73hBbwJXWqg/m9zqajRUNMJf5vMK4EKLdIlTH3w2z8hyPNYyfRb
         sHQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764176139; x=1764780939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YsLR0RJnm38Fp5r7CqZvtnDjOXjaQRJuirTuBdqGYYg=;
        b=WKdG72dFehBeRbaIqEUvuP9wvHLDfidOB6SYZ0xQkpArA7nbm7p6faNOOGLlU8vDLh
         vYN46oLajV5GVfXz7gT0YT0Ao3UQc5fl/vjMJwMBjfCs9FcAqW8ME2w67YTJ1SeK91y0
         5C6UjH7xqmQMP1uvVLoN+ZcrWriXi6qhfuDhnqeH75fdqttVvaK8MmKuV2Vl6L15QkWO
         DXVn9a93ru5/1cLbP3IGtpRkRzSNt8rX602SyeEqIhH2mVVBsKet6gBpJYZmCuYrhu0v
         v1EB4CacBBRSAIXHsvhDsNn8FJRbSdKgmIqHuRW8ADnWTZfoMBRcWHGV+PU/crgXpzNV
         JCXw==
X-Forwarded-Encrypted: i=1; AJvYcCU2sDKPDshFRhPjjoFXVLFSbDtBIsx+DevMF2K0REB1176nt+XtlZqIh39dR7zBeFG1jWk7lF1YFRH1@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0EeAVuJjtfiJ1Yd7sD5stu5Gpms4IJDK0mcxZz+Zt3QhiMkF9
	u0rRFSZJIlCAbEx3BFGDl9rIEyv+bgE7Geo3A6P49dLvtMQxUelcBwwD
X-Gm-Gg: ASbGncuSnr+fGNUwuHMMknqpqGpPR0S5BtlUJBHzeyeMkcdnXjq9D2rLaU3gfn3BIvm
	VgbYTUf3kvvzcw6m4GBj7VimOkqavF8No/rdnh8JgY0dLaUy2b/V3K8v1MNGBKSrGt1cscONwGT
	KspjtY8XgEVe25mSo6CM3jRnOjejGgwIgjaatyjzkJRNXrlxmz3afpWtJJLx3oq65EX8Gm4f7KF
	2X7X7EjISQN94xghUPsSAF7p04Sm9nU1racCH9JXhGctNW8u3QTROoWz1nTEjSTfuqgUwwyvL6Z
	rwjMUd4MzvA+GD134hukU61Y2N9N8P6wKDPjk5NJq0ktRHfKDUuRAa+7thUTbo4pMG9lPu0WFWB
	FR58kL0E14KFnotjhxL97aLw49XEZ+5w9S1YfOyO/e9OACd4/BRl74tDCl4DuS1ylXch+Q6XMkv
	APUJRH+N6x28aOdO9D40mc7g==
X-Google-Smtp-Source: AGHT+IH6cuG9oEeYrc3Fz+ThAFudgaYZ2XGiyeMqLPbjuZeQq1pwyPE1LvTCIEY9wFQ2EuUIbEmwCQ==
X-Received: by 2002:a05:6a20:9148:b0:35f:4e9d:d28b with SMTP id adf61e73a8af0-3637db14ff6mr7976498637.18.1764176139306;
        Wed, 26 Nov 2025 08:55:39 -0800 (PST)
Received: from DESKTOP-P76LG1N.lan ([42.116.199.188])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bd75dfed99esm19887078a12.1.2025.11.26.08.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 08:55:38 -0800 (PST)
From: Nam Tran <trannamatk@gmail.com>
To: krzk+dt@kernel.org
Cc: lee@kernel.org,
	gregkh@linuxfoundation.org,
	pavel@kernel.org,
	rdunlap@infradead.org,
	christophe.jaillet@wanadoo.fr,
	robh@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v18 1/3] dt-bindings: leds: add TI/National Semiconductor LP5812 LED Driver
Date: Wed, 26 Nov 2025 23:55:32 +0700
Message-Id: <20251126165532.160730-1-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <74d6319c-535f-4409-a3c4-299ab946af54@kernel.org>
References: <74d6319c-535f-4409-a3c4-299ab946af54@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 24 Nov 2025, Krzysztof Kozlowski wrote:

>>> +examples:
>>> +  - |
>>> +    #include <dt-bindings/leds/common.h>
>>> +
>>> +    i2c {
>>> +        #address-cells = <1>;
>>> +        #size-cells = <0>;
>>> +
>>> +        led-controller@1b {
>>> +            #address-cells = <1>;
>>> +            #size-cells = <0>;
>>> +            compatible = "ti,lp5812";
>>> +            reg = <0x1b>;
>>> +            ti,scan-mode = "tcm:4:0:1:2:3";
>>> +            vcc-supply = <&vdd_3v3_reg>;
>>> +
>>> +            led@0 {
>>> +                reg = <0x0>;
>>> +                label = "LED0";
>>> +                led-max-microamp = <25500>;
>>> +            };
>>> +
>>> +            led@1 {
>>> +                reg = <0x1>;
>>> +                label = "LED1";
>> 
>> Completely useless label... You require labels, so people need to write
>> something but since they do not know what to write they call LED 1 a
>> LED1. This is just not helping.
>> 
>> Use color and function properties. Same everywhere else.
>>
>
>And now I went to older versions and I see they were correct - you had
>color! You replace correct code with wrong one and drop review. This
>patchset is not really improving.
>
>BTW, You actually received review also at v6, so this was reviewed 3 or
>more times. Way too many times.

Thanks for your feedback.
To address your concerns, I plan to roll back to v17, which was reviewed
and approved by Rob.

The only intentional addition in v17 compared to v14, which you previously
reviewed, is the ti,scan-mode property to configure the LP5812 scan mode.
No other aspects of the binding are modified.

I hope this resolves the issues and keeps the binding stable.

Thanks again for your guidance.

Best regards,
Nam Tran

