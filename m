Return-Path: <linux-leds+bounces-6569-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E3AA7D025B0
	for <lists+linux-leds@lfdr.de>; Thu, 08 Jan 2026 12:22:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9A3D930407D5
	for <lists+linux-leds@lfdr.de>; Thu,  8 Jan 2026 11:22:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78873432FA9;
	Thu,  8 Jan 2026 09:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GsYouXFJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G0wVTuRy"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E984308B9
	for <linux-leds@vger.kernel.org>; Thu,  8 Jan 2026 09:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767864075; cv=none; b=SStnxm5yT7mkbE2ujmVAd5HFeDH7ia2CZxj/PMNXlmVBMr1tLQ5oqW42E0SDEUF66ZPtDwwLgv4x0QhSNmQC8BRdlIfDdQhBAa9ndjbpmLDoVQ7lrx0DpIyz7x5dcGzCZ9xvpf3OfBEYuXI0QqRwV8PUwE0tQNx6vAYhtPriiwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767864075; c=relaxed/simple;
	bh=0l6Iqs3MgqzCjVQEYOZPwQFM0SA2heWQHlyq1HLJ6Yc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GiYxNzk6nTb+advjS9jj7M0g7Ae8904HJYhb+qHvPgP5SJwi/8Di6X8eSIXCsA+onzi+69glTy93l43mSGtiHDAIQfM+j6sTeHR3r73xi3lwswdNUeh3OuIsxTwITl8uwVd+GzUafrWlJ6vswHhS4zG2h2r2UId0oy+pD8dp3Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GsYouXFJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G0wVTuRy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6087VNFn1837901
	for <linux-leds@vger.kernel.org>; Thu, 8 Jan 2026 09:21:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RUASEvoKgRbhk1dUkVLvuBQGOMUb3++LPBZvsx88wnc=; b=GsYouXFJYnNMjuVs
	IW9p0883DTxHMonKCRgmL/qi+ODHEw59CvDzzE8ITwPDCXk8weNAmtaQm/YQdtdx
	CqP8NtLsqrrglui9Y1Xw7nR7T4pqHQ0U5aPZERxKnqH1MjjQW2crPSezbyHg0SUl
	NPoQD6xyKGzVzNf0MRMCxH1GCos+0cWXJTgzR62uJt6T+R4wXiANh1BlEvXxmBWM
	kcSTJhTHR55Lgp1DeuqsEKlT2qP+47zwrPzCQ70mb7r1rTgPQmjaJhU0fRSgq/SC
	CNZhfeWHmsUAr1C7DKuE0u7QItPhjIQcot8F2GNXY0z4cUG3pUQhq+h80yOKTmPt
	aZwpaw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj8920ayg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Thu, 08 Jan 2026 09:21:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8bedacab1e0so100630585a.1
        for <linux-leds@vger.kernel.org>; Thu, 08 Jan 2026 01:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767864067; x=1768468867; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RUASEvoKgRbhk1dUkVLvuBQGOMUb3++LPBZvsx88wnc=;
        b=G0wVTuRyYUAsO3L53davM3FIs0PcNofE97FT6irKVNuHCyylKT8vObMa5+CsxI/2kq
         UrxBAAXlqMuvKS+aT2RWUeV4QUKF2xBa5PnHD+5W6sXuwSwsJrsiPbsoOFWxWY8ASkRM
         dwcAx8UdC2yhtDNR4kcuaV+KM38KYkctEKNbguU/MsoTq2yw4JoyAHudE2dOr3MNR+Qx
         vrt0IelW68/PstPJTgA71U9aHNHflPqnCcFuKI1L6KcORgPrdpIWzlX59xm7tMKmk7sZ
         g53LZ/hx+lwEsv/56anpo57vi+7QAe/BjGSMEbKDgiRP0Q25aGVk7GuWkgG131b1eagd
         a3gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767864067; x=1768468867;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RUASEvoKgRbhk1dUkVLvuBQGOMUb3++LPBZvsx88wnc=;
        b=nbygcV9xzGRqrSlLOH/zLePOuXzl9Tm7Z0Qo8YzupnRJ11Km4+5NtSQW7BZuxgJ5KL
         DtP5bsvZ5PDRePhnw4lOdANuNH18vFHLFKq4MEpuyVVQQwcEM7LYNMJSlIuCVagcl6q+
         wcGbjPgMPLO9B9L2Y4YX0mUUfB7yuLXgibHKuf3I/pT1oi3WaVMRcttc2Qh7wPj9C7dx
         zpkYHkiEqlmuqUnYz3iSbe9mDJ0b1BQGoiHx4Tl8+qQOFG2nA181HRehwpND1+Yg+pnu
         qy7nkIB1mHJCkwqdvhit/BEAFi2I7gEMtIbAIeApsWcjzY4FJEYN40nw/hCxWrw6b5dZ
         OcLg==
X-Forwarded-Encrypted: i=1; AJvYcCXNhvM/XT+VCNJNi1qNe1ydovETkpZzeOOg8p7iOR6o/v8tdwuampnLobh3WZiM1qR6Fb6AVqMqhmRm@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi3nYd0TFqI7qhwjKF/4jIscpaVE24+Bb3arDhVHwnC4m3w8aE
	+NkwVWMYKxbmepDsgcDIG0UMSLp38cqwOcJHBj6Lgy1ldQa+QGdHM6S6yoCds+k3A7lSP1+/47q
	gYz6I5SCFAkLPfKe3JpxqOc/xDnNbqBP29VMxQ3UY57DYU8SDNamtOcXSRriFmd1G
X-Gm-Gg: AY/fxX4X7gkTQK5uUifI8178DRY9YF646baz7WU7IJUsZvfNv59bXvTA6istq3us+C2
	UI2BRt89vbu0Rfna8pE47jJZAcS7/ZNgtvqx4UwS94VJTzEWHdJSSLwoo7ore3OBLv7FNe0RBQu
	9GLydKH8YLUyJakvTYmhRSQEZu2sK9lASCykSyOcJUn0a7Tv/jEyPp8iQOkY9yMIIPzzbJ8yUhB
	k7M2XrNDi6l6h0Et3h7agb6LUPLZvkRQrGyWfBLcZqtu8ZzfeFRjywtwIrWhUYHNWnklycYorR6
	XRR/4mCT31aYHZMcMdumfeGOxo2zIF7TrkLEHwfat2b3KeQnAUj9CoBrheJdbAXEMhl0GV76S5V
	pBLb3bZ9abMLPkxJdtt2vEPaxyARsOQ44giO8SBsnnXqR+k64gMq5fYMyCkAOJbLrXA4=
X-Received: by 2002:a05:620a:4892:b0:7e6:9e2b:6140 with SMTP id af79cd13be357-8c38943b7femr567259185a.8.1767864067001;
        Thu, 08 Jan 2026 01:21:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFSH8xh0nRYmxacJIRP7jsT1v/IUGFzqMnGgVqOwnhbwUDo4bcraE4vEjb3nwQSNnL88CCsDA==
X-Received: by 2002:a05:620a:4892:b0:7e6:9e2b:6140 with SMTP id af79cd13be357-8c38943b7femr567256285a.8.1767864066468;
        Thu, 08 Jan 2026 01:21:06 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a5118d3sm763110966b.47.2026.01.08.01.21.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 01:21:05 -0800 (PST)
Message-ID: <ce7c86c0-6feb-48b1-9fd8-7ce3bb825428@oss.qualcomm.com>
Date: Thu, 8 Jan 2026 10:21:02 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] dt-bindings: backlight: qcom-wled: Document ovp
 values for PMI8994
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Kiran Gunda <quic_kgunda@quicinc.com>, Helge Deller <deller@gmx.de>,
        Luca Weiss <luca@lucaweiss.eu>, Konrad Dybcio <konradybcio@kernel.org>,
        Eugene Lepshy <fekz115@gmail.com>,
        Gianluca Boiano <morf3089@gmail.com>,
        Alejandro Tafalla <atafalla@dnyon.com>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Daniel Thompson <daniel.thompson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-fbdev@vger.kernel.org
References: <20260108-pmi8950-wled-v2-0-8687f23147d7@mainlining.org>
 <20260108-pmi8950-wled-v2-1-8687f23147d7@mainlining.org>
 <45a2b510-c825-4191-975a-1389f4f18903@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <45a2b510-c825-4191-975a-1389f4f18903@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=M45A6iws c=1 sm=1 tr=0 ts=695f7703 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=tn3pFvwZU5TYnyux6WMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: SoDkwMXggbBJWDFd_HuHbEfF5U7TFk4W
X-Proofpoint-GUID: SoDkwMXggbBJWDFd_HuHbEfF5U7TFk4W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA2MiBTYWx0ZWRfX8HYHg2TgfwFU
 6oj9CwBqLtj+0ywhekNfaGPMxVsLjvcoUQdlY9UCgrEUv5hHlCGl0j6MV2CnbfQgllaobxHrj4T
 nKTr0eLKRdMWAj1W817j4UCpMWLdAnezirgoVyQ2F9znBN8MEKKel49RO3zqb+FnngWNug4Rnn4
 Su2gwxIMRLLvib1tRTNiiYCHSs00VZLBDMzPz+MjtRdqMhezJF1r/yl6sDtH0Jb0PdTqrLwIYLo
 x1vhUtgmBwOLZ0fs4HTxDDBbaj1GlbCy3vwLrrSV8a6HPyBGl3141ApJGOtVv8Gg1ZJlQg+rc8r
 Ud0iM7UNrlxQapIU8+ZJ/tQ5f/FSOh1K+1FZCbuyd0u1B6xmIAirQ3BZZDq8yIvCb/gEfdlgOVs
 EqwCM0FE1pWlonYHlu2JkBSLBQ8LDtapv8T1ckwPlxx9ng+3j25tuf78vic+Dmud2vG19SeniQr
 V97I7pW1kKM1iI0d4lw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_02,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601080062

On 1/8/26 9:54 AM, Konrad Dybcio wrote:
> On 1/8/26 4:43 AM, Barnabás Czémán wrote:
>> Document ovp values supported by wled found in PMI8994.
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> I reviewed a version of this that said PMI8950, which is very much
> not the same..
> 
> Let me try and get some more docs to confirm or deny what you're
> saying..

PMI8994 indeed uses the same values as PMI8950, so let's keep my
review tag (but please be more careful about that when making
major changes between revisions in the future)

Konrad

