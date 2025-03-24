Return-Path: <linux-leds+bounces-4358-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7ABA6D395
	for <lists+linux-leds@lfdr.de>; Mon, 24 Mar 2025 05:39:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD3311893FFA
	for <lists+linux-leds@lfdr.de>; Mon, 24 Mar 2025 04:40:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A89A1624E4;
	Mon, 24 Mar 2025 04:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gUmsYPVU"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD1217C98;
	Mon, 24 Mar 2025 04:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742791192; cv=none; b=HtWbSDgq4yJFnOxcHjndGcy/ln1fLzPxqBS4YOfAwJoObbUE4nmlj7YqnxVdSAv7LFXcbF9jSMe/rUwCior/BP9eowkXq0D8wo/QX/XptGp+cnM2BmNakf2jTpEIYbgMgHdnK8SEJw/bGU5XWeNOSZGbQgpYIVovZpwq0ZLqiwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742791192; c=relaxed/simple;
	bh=bLydqWjhM1B7vEwtHxkX/eEz4MhuQyQvlDU40xRN73M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oXDAbCGb9qyds2shF0z989Vt+ioyhomjkfhApsGaGIr0TXCCDQ+TziUtahmSAIBoO4MX45xZ5cNQ0vDojQKC0aF/UMzuR26flpjQpzVydZdrf8zyytowcWYqZ429bWsGEblV7XAh9FNjYf7i+HiaPe8zhEzdavd7qd8Ic0mUtJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gUmsYPVU; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2260c91576aso64568755ad.3;
        Sun, 23 Mar 2025 21:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742791190; x=1743395990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NJiGMqARJ6F937zf06+BViA3Gv/CNPmEBgEvEBsQkgs=;
        b=gUmsYPVU9po9E/LpXdxGzTQnnXOPu9o9JtPA5OEsZJtf/Dhb2TxBkoXv01VKx14mnp
         yud39Z5cxEXZcuXf4KveK/tCJoMeWgWgZwt4xmOUst3smJN+dy3vHxHbb4LS/xa8vYQA
         3Fz5hov7um7Sy6GZFns+8ZmK86KUC76+Pwdi9zfdMmhdtBlyUCtoWtg9aUjR9Bnr81xU
         tmODLJwSVoM+Gh/tzrkR4KDXGqukEQqLVciSNs851shjnv4UW7Tec8XJqF6KJdJhYF5i
         YWzA5DX46//M8V67F5rQJUk+yE6VZec165XUFzmhWhbAthQqXOrjsNFe3oqEV1aLJNLk
         4IVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742791190; x=1743395990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NJiGMqARJ6F937zf06+BViA3Gv/CNPmEBgEvEBsQkgs=;
        b=PvvnkeIWDGfVSaMbc8z25pcqubUnybQV7GEw/apG79K1S0s3CtJR1+4Tv0TteHcBsF
         Uany8z6RbfF36FcqYTILZqKIp5X9ew8pt12uZL68N2ESkbaZ3gxcHK5cQ6zMkHPa3uxV
         8BP4NESvh8MHS/116ZKrQwQOEzxli3VrBTX6HAp4r9sePEvRVWi9gjwc+E771d1qSct2
         /A1zkFNpbP0VU8uquX86BuWUQiQ3HSWRm6SScfaKTeKmTsQC2a2eDSW4CIHTqZG5rsc+
         RwnWKV/YzAzx1ukw6CYSGzXv4KLNtA9zm1hLksH40NHdTzxcT5ZPwmIy2uxUpq9CS1KU
         y3yA==
X-Forwarded-Encrypted: i=1; AJvYcCUY2BkdQX0l3FmjPhchC8jjIVs6giuMno4n9CxmgbJDX6DQMSJrMktBfwGd3dPrf7Ra/2tHse1Ry8fcIVIg@vger.kernel.org, AJvYcCWBl7o+vPxDu4IKXimxDXoxa1OtxOmKo5jvYkPnO2nBbshv9s9/b3AasECnbTB25+juG8/yzujUXQB+@vger.kernel.org, AJvYcCXcpzhU+HGOnzbR45PHuVZTEztrZ6r5W77mAD8hpYP+107Pbr/cby9SFD0JaKFeVzFgRk2a5p70cWM10Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxpqrhUuBo/U/3Qk/MTVNr+BYm92jSS27QkT/xrPhEMdVO3tFzT
	GycSbR7RaL9RVrUUy/OmQtdIp24pp+bs7la4McGid/CvzyXnuXR4ZKgmw3Pj
X-Gm-Gg: ASbGncsr0lxZxC0/Hfa3qp2VouZU5hFj+BmyqZO9cv39htllXDDKZjXCbDAcqd6B3a6
	2A2nqItb+4JENjgQ+hi5C669pWEVHeO2Z7u+CgUrqr5fOuBLnMfVSyNFahQYRY+gUDpAVj9PfQ0
	m/T7BFkebjWPBNm9R1KJ5WNL8Pd3aIxYxux0t6EkOi015n5R0XIE4XHPqF/QZthhEBx0Czu16KE
	K022In0DsEELSY6l6PHV/w214RtvjfVyltQnu16ZcUkye8tItFVPeib+3eBed13jr9YkgPu4xsP
	drZOj+gEvYUOzi4rL2MdJ++DBbt8ukNAdp2KJvyxQf2BmWT9oEGh/A98iQ==
X-Google-Smtp-Source: AGHT+IGbTLiSDc7gbbQyXlGf8FcXIjRfo066WaItNTko/ZQZu96X2tYhszKfkZBIoonNrCu7fcF8rw==
X-Received: by 2002:a17:902:dace:b0:223:67ac:8929 with SMTP id d9443c01a7336-22780ba2de1mr188988655ad.0.1742791189368;
        Sun, 23 Mar 2025 21:39:49 -0700 (PDT)
Received: from localhost.localdomain ([27.70.184.106])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f4619asm60822885ad.95.2025.03.23.21.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 21:39:48 -0700 (PDT)
From: Nam Tran <trannamatk@gmail.com>
To: krzk+dt@kernel.org
Cc: pavel@kernel.org,
	lee@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] leds: add new LED driver for TI LP5812
Date: Mon, 24 Mar 2025 11:39:23 +0700
Message-Id: <20250324043923.15276-1-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <2507f003-c4f1-44be-93cd-176697f0bc8c@kernel.org>
References: <2507f003-c4f1-44be-93cd-176697f0bc8c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18 Mar 2025 19:54:15, Krzysztof Kozlowski wrote:

>> 
>> In previous comment you have a question
>>  "Why none of the 10 existing drivers fit for your device?"
>> 
>> Nam: I have carefully reviewed the existing LED drivers in the kernel, but none of them fully support the advanced capabilities of the LP5812. Unlike basic LED controllers, the LP5812 has difference features and register
>> For more detail, please refer to this documentation https://www.ti.com/lit/ds/symlink/lp5812.pdf?ts=1741765622088&ref_url=https%253A%252F%252Fwww.ti.com%252Fproduct%252FLP5812
>
>So you read my question and decided to not give an answer. Great.

I am sorry, this was my mistake. I thought I only needed to update the source code based on your comments and submit a new patch.
I will make sure to respond to your comments more promptly in the future.

>The burden of proving this is on you. Do not expect me to read this and
>10 other datasheets for existing LP devices. Maybe they fit, maybe they
>don't but based on style of this submission and style of the code I feel
>you just want to push your patches instead of integrate.
>
>That's not how it works.

I appreciate your feedback. I will provide a more detailed explanation rather than just linking the datasheet.

LP5812 is a new LED driver family. LP5812 has different registers for new features such as run mode, config AEU module...
These are not supported in the existing drivers, which are tailored for different device architectures or use cases.

The LP5812 uses a register map and control scheme that differs significantly from other LPxxxx LED drivers.
This required a custom implementation to manage device mode, select LEDs in each mode, configure autonomous AEU...

Integrating the LP5812 into an existing driver would introduce significant complexity,
as it would require modifications that could compromise the performance or maintainability of the existing codebase.
Developing a dedicated driver ensures clean, maintainable, and optimized code.

By creating a separate driver for the LP5812, we ensure that it can fully exploit its capabilities while maintaining compatibility with the Linux driver framework.
This approach also facilitates scalability for future revisions of this or similar devices.

>> 
>>>
>>> The driver is implemented in two parts:
>>> - Core driver logic in leds-lp5812.c
>>> - Common support functions in leds-lp5812-common.c
>> 
>> Why do you make two modules? This looks really unneccessary. Just compile them into one module. No, use proper kerneldoc Missing kerneldoc. Every exported symbol must have kerneldoc. Why this is not static?
>> 
>> Nam: I will merge source code into a file only. Therefore, I don’t need to export symbols here.
>
> I cannot parse this. Use standard email quotes and replies. Like every
> email client since 30 years.

I apologize for the formatting issue in my previous response. I will ensure that my future responses follow standard email quoting for better readability.
For my remaining unreadable responses, I will correct them and reply to the corresponding emails.

Best regards,
Nam Tran

