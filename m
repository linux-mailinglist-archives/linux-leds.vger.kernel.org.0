Return-Path: <linux-leds+bounces-5133-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B18CB11EE9
	for <lists+linux-leds@lfdr.de>; Fri, 25 Jul 2025 14:44:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 792EC189BC6D
	for <lists+linux-leds@lfdr.de>; Fri, 25 Jul 2025 12:44:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AB232ECD1A;
	Fri, 25 Jul 2025 12:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eqeD5n3b"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6409E2EBDD1
	for <linux-leds@vger.kernel.org>; Fri, 25 Jul 2025 12:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753447343; cv=none; b=PCsX6lbfSGhmU/5gZpjRzkpYjMLKTILmtKJX37c5xQUJGcXLYNsPQXgZoFONEB8/+jeKd1jqanaWxO+NJbIxEa072UCjZrKLDhY6I/C53FcMKU3HVzOcQtoyPFHtxcDPVadiC19D26QvquTmalPtI9mDy4Rt2EbduEnbc+nyCY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753447343; c=relaxed/simple;
	bh=eF6jcCycbuLtKWGj1n33neuzLN4zW9NG3LxK5UiDPPc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hSUhEuFQeOo2xJw4a6XBMhYiuvQ/zGzIGJVpXHqOPZA9hqunkh4I3oCu+gLxc2U2Qw0BKclRlAHsdj/2gKIIG/+5CVupi4GvJ6CCzI9GRjebvAwAQKVEGpdsRLwwxiDzNryQXiFYk4JdZZvqwry/bZ6LzJbdnvBb6lA12WSqw1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eqeD5n3b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56P8JWBf004418
	for <linux-leds@vger.kernel.org>; Fri, 25 Jul 2025 12:42:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LhQRzHb8yYt93GhMbsQukxzdBNoYn20J1vJtQUloums=; b=eqeD5n3bBxhsghnv
	nnTYw9phj0yplazeT9CwTTzkMky8ECUs7SfWHv4rG8DAUyjeXuNHpHN2H3N1x5Uj
	OgF9VjqO5hkrjHq+797+rNtXe48FK1lsphU6DjqkqK/9IeQ5M182iIbYkrR/8eJj
	I9NYw3taXla14O4qq8yYZAbJMo8Ui5TCaeq5gHDIvKOiocrSFbEw/3ncYaVoippU
	udPzie1Kg+PpnFoBf2HGPaemjvTvS07LiQ7M/hJPk6kiTRvp02hkrduoIbXJNAYQ
	XAxGD5gSezQm1p4H33raazwOqu8+OFV/NE6xHxoNrZ8gEgIRluqKZWPYNdB68IQh
	x6NBvQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483w2kt4ah-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Fri, 25 Jul 2025 12:42:20 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f539358795so3459676d6.3
        for <linux-leds@vger.kernel.org>; Fri, 25 Jul 2025 05:42:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753447339; x=1754052139;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LhQRzHb8yYt93GhMbsQukxzdBNoYn20J1vJtQUloums=;
        b=Edl3KIqLpZ0C6C1cAUB8m5tAc9/LLOXJmpn3+M5vAHkbl6gfffKiNLcZJQsjmiJ2l9
         qtFnCgPNgpMQ1rxaaAM66KT/3ARg7JsLrw7xmA4S8/q+XLGoVxZJYXa/WKzz6xX+uWV4
         mohLjaOud9Ekf0ePN6bPCcuGc89X9U0SJvlKlVbe29/p4QjCJLX6/UfqfeSxpm0AzVqh
         OC41B5HB+DzIQ65ELEulQvPwK/Z7xraishAtbhA5w8FBa0xwuEMVhBn3OwirsR1dxZEk
         QXb8Th86k12e3ovTmYTVN91jGcHm2g0GLUFIf+NgNknLltpffEef+k3enhHzMz9KJWbF
         qV4A==
X-Forwarded-Encrypted: i=1; AJvYcCWeg+EOFqEpL1A1csRx5lnsZqa2JYmXMI1JunkGQHzlLHeLt84oIiRM5qM6xF1nRbYZPa+ZMMCYz88k@vger.kernel.org
X-Gm-Message-State: AOJu0YzTF/i3j7E+laR9Eg4KBqti+Kn0af4OOONM6kUsrU6aX35iQ3rf
	VM9Rg8zfYTdH2DXNmifw77Wm1L3MdXqpbdjibfXG9TrXeh7BzNpQ0MZBGyyGCpSZQSkGePUIW0W
	eAb+WndWyBRAM9zL8UVGX/I5UvlkK5z6Qsn+WsvM8hx89FZplt8snwNVZuyVIGb1o
X-Gm-Gg: ASbGncswnKqfbt00OXRpgJ8W1+CnXJJmxacxisdac5LUEp5hEKHJyOIkUE8Tw5Y7PzX
	5b5/2graQfYAFUmZQYbthEVHXxnDKwEC8LSx5QZKzTm6M1wUMHSt1czzAtfCeh2tdEQsDeieKXL
	1HrupIkfHP2+cMoj6m7Qzkkt2qr87AIVvMa3CFMyqQ8BjgGu4o+Fs2Y49TB6yMHdwGVkBcHbQi7
	HqXKjKKqhR/sjtns74HlOGl3jEXqWpEqFrmNMux2j48w6A3Qr9+7xJ4vaUd4Z/jPmc8dTEzaJu6
	r2lRy2xI2FdBj+5Lr77pd1a1akY0NnobNcQ7JCTOUqw9IgnzoLspXAweiOlpBI6mzDHlqhc/Dgz
	FRYpTgYdrytL4FDd3+A==
X-Received: by 2002:a05:6214:1bc9:b0:6fd:75e1:16e0 with SMTP id 6a1803df08f44-707204cd90cmr8732046d6.2.1753447339100;
        Fri, 25 Jul 2025 05:42:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHcNKKegjXwc03c2xHl6u8ikHVWlVcUyUE5gVGFjp9xIoK7wro7ZLBbzntdS8cdJqm9bMkAlQ==
X-Received: by 2002:a05:6214:1bc9:b0:6fd:75e1:16e0 with SMTP id 6a1803df08f44-707204cd90cmr8731796d6.2.1753447338519;
        Fri, 25 Jul 2025 05:42:18 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-614cd2fdbb3sm2097125a12.31.2025.07.25.05.42.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 05:42:17 -0700 (PDT)
Message-ID: <12c9b2b0-e084-4518-9f28-735fc80444b2@oss.qualcomm.com>
Date: Fri, 25 Jul 2025 14:42:15 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] leds: flash: leds-qcom-flash: add a separate register
 map for PMI8998
To: fenglin.wu@oss.qualcomm.com, kernel@oss.qualcomm.com,
        Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Fenglin Wu <quic_fenglinw@quicinc.com>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250725-fix-torch-clamp-issue-v1-0-4cf3ebaa4c67@oss.qualcomm.com>
 <20250725-fix-torch-clamp-issue-v1-2-4cf3ebaa4c67@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250725-fix-torch-clamp-issue-v1-2-4cf3ebaa4c67@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: PrDWqUZAA-RJyO4vUEDPIa6dTy1gPUmq
X-Proofpoint-ORIG-GUID: PrDWqUZAA-RJyO4vUEDPIa6dTy1gPUmq
X-Authority-Analysis: v=2.4 cv=QNtoRhLL c=1 sm=1 tr=0 ts=68837bac cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=lzWBnrassQNQYiy42ZQA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDEwNyBTYWx0ZWRfXzDXl2S7VOkFK
 KoFhfvVHMbv5wJBe5hGEGTJWYVt2OL5NprzWOesMAerxzDYQrPeaNI2lJe/BNphc/t+c1hvJRel
 ATwogAl+KEflT9HPCEsyKRW4RchNLgRGsdCWCoHh1E0znVCAPw/AJdnS3MfZKVdp6eIVSPrWR++
 jbdQLO0hmG+y/HvY8SWdeNcJzUCilBdcdXQhC+71GzFXlHWejWGta887jAZXiUknEKNkSAH6ZPR
 XQ4ajveH7I/unVP4GE0eQ+H6f58kzdX29Iq3AKGUG56x0/vautZhzocBhXEHT8sIPgWRmSv2CAk
 uKEkwm+p3am8f6k/IjV8NJKGjOeJuFCwdKzr7EvFABab5G9BW3wIQwVOwY9PNIJcFFXwgiIgLLl
 rwHuklIDYOn9Z6EKVOWuOtxcH1H1GRzeH07vcJ4N3UO0ZoGuDb5v8JM/8XX2Xtf1I7hOlfth
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_03,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=825 bulkscore=0 mlxscore=0 suspectscore=0
 spamscore=0 malwarescore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507250107

On 7/25/25 12:04 PM, 'Fenglin Wu via B4 Relay' via kernel wrote:
> From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> 
> The 3-channel flash module in PMI8998 has several registers different
> than the others, such as: torch_clamp. Add different register fields
> for it.
> 
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---
>  drivers/leds/flash/leds-qcom-flash.c | 25 ++++++++++++++++++++++++-
>  1 file changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/leds/flash/leds-qcom-flash.c b/drivers/leds/flash/leds-qcom-flash.c
> index 9c2e41cfddcf2d50d5a633cb157084371a631d74..2554ef7bcae6bc8f66edbffc7c885a9386b263ad 100644
> --- a/drivers/leds/flash/leds-qcom-flash.c
> +++ b/drivers/leds/flash/leds-qcom-flash.c
> @@ -118,6 +118,22 @@ enum {
>  	REG_MAX_COUNT,
>  };
>  
> +static const struct reg_field mvflash_3ch_pmi8998_regs[REG_MAX_COUNT] = {
> +	REG_FIELD(0x08, 0, 7),			/* status1	*/

bits 0-5

> +	REG_FIELD(0x09, 0, 7),			/* status2	*/
> +	REG_FIELD(0x0a, 0, 7),			/* status3	*/
> +	REG_FIELD_ID(0x40, 0, 7, 3, 1),		/* chan_timer	*/
> +	REG_FIELD_ID(0x43, 0, 6, 3, 1),		/* itarget	*/
> +	REG_FIELD(0x46, 7, 7),			/* module_en	*/
> +	REG_FIELD(0x47, 0, 5),			/* iresolution	*/
> +	REG_FIELD_ID(0x49, 0, 2, 3, 1),		/* chan_strobe	*/
> +	REG_FIELD(0x4c, 0, 2),			/* chan_en	*/
> +	REG_FIELD(0xea, 0, 6),			/* torch_clamp	*/
> +	REG_FIELD(0x56, 0, 2),			/* therm_thrsh1 */
> +	REG_FIELD(0x57, 0, 2),			/* therm_thrsh2 */
> +	REG_FIELD(0x58, 0, 2),			/* therm_thrsh3 */

Please keep them sorted

Konrad

