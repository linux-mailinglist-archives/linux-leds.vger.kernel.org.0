Return-Path: <linux-leds+bounces-8392-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WBLyDCRAG2oMAgkAu9opvQ
	(envelope-from <linux-leds+bounces-8392-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sat, 30 May 2026 21:53:08 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1F56131E5
	for <lists+linux-leds@lfdr.de>; Sat, 30 May 2026 21:53:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D839530530E5
	for <lists+linux-leds@lfdr.de>; Sat, 30 May 2026 19:51:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C530C2D0C82;
	Sat, 30 May 2026 19:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rb2xKjs4"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5C429B799
	for <linux-leds@vger.kernel.org>; Sat, 30 May 2026 19:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780170703; cv=none; b=ohHPblhU9yqsJssSdROFuPF9oRFAI/Se4KBowpzR9R1ksIf7uPu3x++CAapBtdcST56SvjHi/o7GZeDbkI3MTdmGg2B9OfniJ/ANSNsfeOznXV6AxUqVy9nnOf8JrwpS5ubEdvBGRZjMGfdpw7kG5fQODD1Zt5jBDoVIwKdrBWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780170703; c=relaxed/simple;
	bh=afSC4jVwoq9wJZAIow45WnW1XZnhKA6USnmIw+3RvJ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sIVaMy6EQC3NTkt+p5vQUkTQfcJgs1TYxvB42NjUUetH27aSTCfdn+jylYzS3R9T26jeGKiz23dfrMlPWrLQiwcGA37e+yB15GRHVs6czD3+opA15MAIPfTw57riXXBU39ujoZrTsGvmtbxQoSklSNov7sw/qE/MhrvOIA3/2ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rb2xKjs4; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-36b95eb4bb4so1251390a91.3
        for <linux-leds@vger.kernel.org>; Sat, 30 May 2026 12:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780170702; x=1780775502; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KUPVDO4TuLnw66Ni1+lzz4Gz256nyEweInp7TugqCsg=;
        b=Rb2xKjs4yH3o+5y1lEvd1A5A785gst6TlaS03qgi6hcmka45u3dC+eymsW/psu6w1g
         0EsbjAl6ihjvSRDBrLZXIVkl7SuSZASANtp2U0H0TxR2ItanvJTub7I325GPnSLNh0NT
         KH5tfqcX93ltlmzwSJvoDw5w/bq1rgfhIDUCYSJ0DBWH/90hmDTHskVbMLEgJUJ5zkIH
         ZwTi9lUg8GTjxTY82QLNCGHuBeeWPLAAfciq2aCQx2AiWbuQkXIEOjzXvS4DWsL8OBxq
         Hq3NkX3Ulwlyg+OquZ9/5xdxmElFM5aYWq+BPBuFhS4lHoZ3msx3F4WyACydOTK/nfiy
         qgOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780170702; x=1780775502;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KUPVDO4TuLnw66Ni1+lzz4Gz256nyEweInp7TugqCsg=;
        b=RHk4YNE5anUhnLmXOMPilwlUXHcjmLWZ3dtURZ2sbugcxVlQwKZBmdjMgEgQzcwzAp
         PkGfa5oIo7hHt+OUvfUEtttyidAUmEhAqDrWf1hlNDvVvjsqeIMuK6Kv5WQBmtoDvBnf
         zOzPh8TA8SOYJq3K1V+/F9FsDp7tq9y7YTevWHENXxvjFVvlpBFpqaK3OqueTuvFcXew
         EcbePuDp+o5e8YzAdTwgprriX0eESkeZ6nCjgEaHg/ltwmPbWOxfZvj5JXErFOS3zfGO
         77RpunVnwzstSak+axmGbV+RiQ+qn0AYvJyL0DydNsrX1LLDVV/0MZj6dpzZAbQbPbKB
         eK8w==
X-Forwarded-Encrypted: i=1; AFNElJ80Mzh5vLlTatnDX3e+GYibsx9gz5lBpIFXQ9UNPyEbdF1PKa9cCzRm5f2HplW2bsZvdN2lnhh3aPg8@vger.kernel.org
X-Gm-Message-State: AOJu0YzgFdMIEnsTqDqQi721/vG0/fFpUHXBDFpmpYwZdM3XOFjyLoI+
	unu/5Prcll6eJ8+LeZOvDXtqimUKxDnIo9j9tU3+O7dLJhh8TXLKFqNl
X-Gm-Gg: Acq92OG87uY+AoU0SYcpt33JGqlwexzEhPKBPAjnmwW14CxNnQ5FGNOLacMYt0Q5uvt
	YbjqXl/yCpQI5j62xRxLEvNcAZA7orp5FmrSPIauNP7w92Rc2r40ejIOq4eN5/EHRQmGviqYhRO
	Zl5PYWEM/dwHRXlA950VKkGdRMFl9oxlOYAYLMP96Aee1cHyr1tuDzbnIsQpRqWNDuKYChDP5hI
	EJtWExFo15ud+OCKoG+UX1x6VEHd2rfB5mS6DqpAJsZ20h4Lf9ekum3q2f3FyeWXt7IkY5sdW1q
	eaGRNRC+E+yqvuFNJr+OX2YSFQ3e/jbJ7wvXWu7CgJN1xhj6m+PxYbDGAVTlMU6ifEQeCCSKlTb
	whN3eBVFFRvbIxeUBQZPEmsgB2DLS/Bx60RhH7SKwD9pkjwY5AB439kw+qHECbJN46vM/fzNVIC
	UTxVmJqcWTeD9k5ZG+kcdzJjIvBOEyuh4SNq4gk17gv17iYu9bPFnzuyn9FGX2lN5gi6hz+58Wn
	3dn/YxmcxLYQRvNRrynDiOsZ2R/g88G2B1TEuyRbyqJ7g==
X-Received: by 2002:a17:90b:1ccb:b0:36b:ad81:c134 with SMTP id 98e67ed59e1d1-36c4ff410b9mr4361367a91.10.1780170701892;
        Sat, 30 May 2026 12:51:41 -0700 (PDT)
Received: from [192.168.0.101] ([103.181.54.100])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bbdb5c91bsm3439199a91.1.2026.05.30.12.51.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 May 2026 12:51:41 -0700 (PDT)
Message-ID: <be560e03-ece5-4dc9-ad8a-907e454e9a1f@gmail.com>
Date: Sun, 31 May 2026 01:17:44 +0530
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: leds: bcm6358: Convert to DT schema
To: Conor Dooley <conor@kernel.org>
Cc: lee@kernel.org, pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, jonas.gorski@gmail.com, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 me@brighamcampbell.com, linux-kernel-mentees@lists.linux.dev,
 skhan@linuxfoundation.org
References: <20260525033258.144291-1-ninadnaik07@gmail.com>
 <20260525-wreckage-gap-9d857408445a@spud>
Content-Language: en-US
From: Ninad Naik <ninadnaik07@gmail.com>
In-Reply-To: <20260525-wreckage-gap-9d857408445a@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8392-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,brighamcampbell.com,lists.linux.dev,linuxfoundation.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ninadnaik07@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: CB1F56131E5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

>> +patternProperties:
>> +  "^led@(0|1?[0-9a-f])$":
>> +    type: object
>> +    $ref: common.yaml#
>> +    description: Each LED is represented as a sub-node of
>> +      this device.
>> +
>> +    properties:
>> +      reg:
>> +        description: LED pin number.
>> +        minimum: 0
>> +        maximum: 31
> Is this missing a maxItems: 1?
Thanks Conor for pointing this out. I will include it in v2.
>
>> +
>> +    required:
>> +      - reg
>> +
>> +    unevaluatedProperties: false
> I wonder if this should be additionalProperties: false instead, and list
> the three properties mentioned by the text binding explicitly?
>
>
> Cheers,
> Conor.
I added unevaluatedProperties: false because my understanding was
that explicitly listing the properties inherited from common.yaml would
be redundant.
I'd be interested to hear the maintainers' preference here, and can
adjust this in v2 if needed.

Thanks,
Ninad Naik

